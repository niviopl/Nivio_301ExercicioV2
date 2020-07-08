FROM ubuntu:latest
#RUN apt update && install openjdk-8-jre
WORKDIR /app
COPY target/Api-Investimentos-0.0.1-SNAPSHOT.jar .
CMD java -jar Api-Investimentos-0.0.1-SNAPSHOT.jar



























     
