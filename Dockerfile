FROM maven:3.5-jdk-8 as BUILD
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM tomcat:latest
COPY --from=BUILD /usr/src/app/target/project-ucll-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/project-ucll-1.0-SNAPSHOT.war
EXPOSE 8080