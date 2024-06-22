FROM tomcat:9.0.37-jdk8
ADD ./calculator.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD "catalina.sh"  "run"