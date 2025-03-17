# Use openjdk as the base image
FROM openjdk:24-slim-bullseye

# Set the maintainer
LABEL maintainer="Your Name <your.email@example.com>"

RUN  apt update -y \ 
    && apt install -y maven

WORKDIR /opt
# Install Maven and other dependencies
    

# Copy all files from the Spring Boot app directory to the container
COPY . .

# Run multiple commands
RUN  mvn  clean package

# Copy the newly created JAR file to the current directory
#COPY target/your-app.jar /opt/

# Set the entry point to run the Java application
ENTRYPOINT [ "java", "-jar", "./target/gs-spring-boot-0.1.0.jar" ]


# # Stage 1: Build the application
# FROM maven:3.8.6-openjdk-17-slim AS build
# LABEL maintainer="vignan"

# WORKDIR /opt/app

# # Copy only the necessary files for the build
# COPY pom.xml ./
# COPY src ./src

# # Build the application
# RUN mvn clean package -DskipTests

# # Stage 2: Create a minimal runtime image
# FROM openjdk:17-jdk-slim
# LABEL maintainer="vignan"

# WORKDIR /opt/app

# # Copy the jar file from the build stage
# COPY --from=build /opt/app/target/gs-spring-boot-0.1.0.jar /opt/app/gs-spring-boot-0.1.0.jar

# # Expose the necessary port
# EXPOSE 8081

# # Run the application
# CMD ["java", "-jar", "/opt/app/gs-spring-boot-0.1.0.jar"]
