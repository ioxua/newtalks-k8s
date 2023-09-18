# Original image: java 20
FROM openjdk:20-ea-4-jdk

# Copy the built jar
COPY build/libs/demo-0.0.1-SNAPSHOT.jar app.jar

# Command ran to execute our app
ENTRYPOINT ["java","-jar","/app.jar"]

# Resulting image tag: localhost/i-k8s-demo-img:latest