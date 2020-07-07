FROM ubuntu:latest
RUN "sudo apt install openjdk-8-jdk"
WORKDIR ./app
COPY . .
CMD ["java -jar Api-Investimentos-0.0.1-SNAPSHOT.jar"]



























     
