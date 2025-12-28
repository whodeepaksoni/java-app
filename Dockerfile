FROM openjdk:17
COPY target/pratice-1.0.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]

