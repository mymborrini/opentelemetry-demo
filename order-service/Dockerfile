FROM maven:3.9.9-eclipse-temurin-21-alpine

COPY ./target/app.jar .
COPY ./opentelemetry-javaagent.jar .

ENTRYPOINT ["java", "-jar", "app.jar"]