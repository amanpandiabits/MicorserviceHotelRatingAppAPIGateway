# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the project files to the container
COPY . .

RUN chmod +x ./mvnw

# Package the application
RUN ./mvnw package -DskipTests

# Expose the port the application runs on
EXPOSE 8084

# Run the application
ENTRYPOINT ["java", "-jar", "target/APIGateway-0.0.1-SNAPSHOT.jar"]