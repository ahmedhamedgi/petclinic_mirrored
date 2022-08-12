FROM openjdk:8-jre-alpine
# Exposing port 8080
EXPOSE 8080
# copy jar into image
COPY target/spring-petclinic-2.7.0-SNAPSHOT.jar /usr/bin/spring-petclinic.jar

# run application with this command line 
ENTRYPOINT ["java","-jar","/usr/bin/spring-petclinic.jar"]
