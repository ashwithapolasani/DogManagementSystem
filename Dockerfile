# Build stage: using Maven to build the project
FROM maven:3-eclipse-temurin-17 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package -Pprod -DskipTests

# Runtime stage: using Eclipse Temurin JDK to run the application
FROM eclipse-temurin:17-alpine
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar
EXPOSE 8080
CMD ["java", "-jar", "DogsManagementSystem.jar"]

