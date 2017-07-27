FROM zhpregistry-on.azurecr.io/openbankproject/obp-base
MAINTAINER inghackathon2017
EXPOSE 8082
COPY  target/*.war /usr/local/tomcat/webapps
COPY  src/main/resources/props/default.props /usr/local/tomcat/conf
COPY .docker/server.xml /usr/local/tomcat/conf
COPY .docker/catalina.properties /usr/local/tomcat/conf
RUN rm -rf /usr/local/tomcat/webapps/ROOT