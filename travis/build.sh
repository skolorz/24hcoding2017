#!/bin/sh

echo "MAVEN_OPTS='-Xmx1024m -Xms1024m -Xss2048k -XX:MaxPermSize=1024m'" > ~/.mavenrc

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

#BUILD OBP-API
travis_fold_start OBP-API-BUILD
	cd $TRAVIS_BUILD_DIR/OBP-API
	mvn clean package --quiet -DskipTests
travis_fold_end

#BUILD API-Explorer
travis_fold_start API-Explorer-BUILD
	cd $TRAVIS_BUILD_DIR/API-Explorer
	mvn clean package --quiet -DskipTests
travis_fold_end

#BUILD DOC
travis_fold_start OBP-DOC-BUILD
	cd $TRAVIS_BUILD_DIR/Doc
	mvn clean package --quiet -DskipTests
travis_fold_end

#BUILD SMS-AUTH
travis_fold_start SMS-AUTH-BUILD
	cd $TRAVIS_BUILD_DIR/SMSAuth
	mvn clean package --quiet -DskipTests
travis_fold_end