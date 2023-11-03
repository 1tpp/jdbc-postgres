# Use the latest LTS version of OpenJDK
FROM openjdk:8-jdk

# Set the working directory
WORKDIR /usr/src/app

# Copy the necessary files into the container
COPY ./pom.xml /usr/src/app/pom.xml
COPY ./src /usr/src/app/src

# Install Maven
RUN apt-get update && \
    apt-get install -y maven

# Build the project using Maven with Java 8 compatibility
RUN mvn -f /usr/src/app/pom.xml clean package -Dmaven.compiler.source=1.8 -Dmaven.compiler.target=1.8

# Entrypoint to run the application
CMD ["java", "-jar", "/usr/src/app/target/postgres-jdbc-example-1.0-SNAPSHOT-jar-with-dependencies.jar"]
