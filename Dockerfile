#FROM ubuntu:latest
FROM openjdk:8
#RUN apt update && install openjdk-8-jre
WORKDIR /app
COPY target/Api-Investimentos-0.0.1-SNAPSHOT.jar .
#CMD java -jar Api-Investimentos-0.0.1-SNAPSHOT.jar
#ENTRYPOINT ["java", "-jar", "Api-Investimentos-0.0.1-SNAPSHOT.jar"]
CMD ["java", "-jar", "Api-Investimentos-0.0.1-SNAPSHOT.jar"]




























     
