# Use an official Maven image with OpenJDK 17
FROM maven:3.9.9-eclipse-temurin-17

# Set the maintainer
LABEL maintainer="vignan <vignan1234.email@example.com>"

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files to the container
COPY . .


# Build the Maven project
RUN mvn clean package -DskipTests

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "target/gs-spring-boot-0.1.0.jar"]