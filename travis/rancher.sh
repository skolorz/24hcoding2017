#!/usr/bin/env bash

TMP=/tmp/.travis_fold_name

travis_fold() {
  local action=$1
  local name=$2
  echo -en "travis_fold:${action}:${name}\r"
}

travis_fold_start() {
  travis_fold start $1
  echo $1
  /bin/echo -n $1 > $TMP
}

travis_fold_end() {
  travis_fold end `cat ${TMP}`
}

function restart_service() {
    local service=$1
    local batchSize=$2
    local interval=$3

    curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
        -X POST \
        -H 'Accept: application/json' \
        -H 'Content-Type: application/json' \
        -d '{"rollingRestartStrategy": {"batchSize": '${batchSize}', "intervalMillis": '${interval}'}}' \
        "${RANCHER_API_URL}/services/${service}/?action=restart"
}

function upgrade_service() {
    local service=$1

    local inServiceStrategy=`curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
        -X GET \
        -H 'Accept: application/json' \
        -H 'Content-Type: application/json' \
        "${RANCHER_API_URL}/services/${service}/" | jq '.upgrade.inServiceStrategy'`
    local updatedServiceStrategy=`echo ${inServiceStrategy}`
    echo "updatedServiceStrategy "${updatedServiceStrategy}
    echo "sending update request"
    curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
        -X POST \
        -H 'Accept: application/json' \
        -H 'Content-Type: application/json' \
        -d "{
          \"inServiceStrategy\": ${updatedServiceStrategy}
          }
        }" \
        "${RANCHER_API_URL}/services/${service}/?action=upgrade"
}

function finish_upgrade() {
  	local service=$1

    echo "waiting for service to upgrade "
  	while true; do
      local serviceState=`curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
          -X GET \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          "${RANCHER_API_URL}/services/${service}/" | jq '.state'`

      case $serviceState in
          "\"upgraded\"" )
              echo "completing service upgrade"
              curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
                -X POST \
                -H 'Accept: application/json' \
                -H 'Content-Type: application/json' \
                -d '{}' \
                "${RANCHER_API_URL}/services/${service}/?action=finishupgrade"
              break ;;
          "\"upgrading\"" )
              echo -n "."
              sleep 3
              continue ;;
          *)
	            die "unexpected upgrade state: $serviceState" ;;
      esac
  	done
}

#BUILD ONLY MASTER BRANCH
if [ "$TRAVIS_BRANCH" == "master" ]; then

	#BUILD DOCKER IMAGES
	travis_fold_start DOCKER-IMAGES-BUILD
		docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD" $DOCKER_REPO
		
		docker build -t $DOCKER_REPO/openbankproject/obp .
		docker build -f Dockerfile.postgres -t $DOCKER_REPO/openbankproject/postgres .
		
		docker push $DOCKER_REPO/openbankproject/obp
		docker push $DOCKER_REPO/openbankproject/postgres
	travis_fold_end
	
	#RANCHER SERVICE UPGRADE
	travis_fold_start RANCHER-SERVICE-UPGRADE
		upgrade_service $RANCHER_SERVICE_ID
		finish_upgrade $RANCHER_SERVICE_ID
	travis_fold_end
	
fi