FROM zhpregistry-on.azurecr.io/openbankproject/obp-base

MAINTAINER inghackathon2017

RUN apt-get install --yes nginx

COPY  API-Explorer/target/API_Explorer-1.0/ /usr/local/tomcat/webapps/API_Explorer
COPY  OBP-API/target/OBP-API-1.0 /usr/local/tomcat/webapps/OBP-API
COPY  Doc/target/docs /usr/local/tomcat/webapps/docs
COPY  SMSAuth/target/sms-auth /usr/local/tomcat/webapps/sms-auth

COPY .docker/tomcat/server.xml /usr/local/tomcat/conf
COPY .docker/tomcat/setenv.sh /usr/local/tomcat/bin
COPY .docker/nginx/nginx.conf /etc/nginx/conf.d
RUN rm -f /etc/nginx/sites-enabled/default

RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN mkdir /var/envs


ENV API_EXP_PROPS /usr/local/tomcat/webapps/API_Explorer/WEB-INF/classes/props/default.props
ENV API_PROPS /usr/local/tomcat/webapps/OBP-API/WEB-INF/classes/props/default.props

CMD \
   rm -rf /etc/nginx/sites-enabled/default &&\
   nginx &&\
   chmod +x /var/envs/import.sh &&\
   eval $(/var/envs/import.sh) &&\
   echo $API_HOST &&\
   sed -i "s|api_hostname=.*|api_hostname=http://${API_HOST}|g" $API_EXP_PROPS &&\
   sed -i "s|defaultAuthProvider=.*|defaultAuthProvider=http://${API_HOST}|g" $API_EXP_PROPS &&\
   sed -i "s|webui_api_explorer_url=.*|webui_api_explorer_url=http://${API_HOST}/API-Explorer|g" $API_EXP_PROPS &&\
   sed -i "s|base_url=.*|base_url=http://${API_HOST}/API-Explorer|g" $API_EXP_PROPS &&\
   sed -i "s|hostname=.*|hostname=http://${API_HOST}|g" $API_PROPS &&\
   sed -i "s|webui_api_explorer_url=.*|webui_api_explorer_url=http://${API_HOST}/API-Explorer|g" $API_PROPS &&\
   bin/catalina.sh run