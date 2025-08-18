# Deploy JAVA application spring-boot-hello in gitinstance..!!!

## Pre-requisites:


- Install GIT
  ```bash
  sudo yum install git -y
  ```
- Install Maven
```bash
sudo yum install maven -y
```

- Install Java17 amazon linux 
 ```bash
   java --version
        yum list installed | grep java
        sudo yum remove <package-name>
        sudo yum install java-17-amazon-corretto
        sudo update-alternatives --config java  # change  java version
```
- this is for jenkins integration
  add GIT Executable PATH in jenkins tools configuration that i.e /usr/bin/git
- Install Java ubuntu linux
  ```
        java -version
       sudo apt install openjdk-17-jre-headless
        sudo apt remove <openjdk-8-jre-headless>
        update-java-alternatives --list
        sudo update-alternatives --config java


## Clone code from github:

```bash
git clone https://github.com/vickydevo/springboot-hello.git
cd springboot-hello

```

## Build Maven Artifact:  below cmd can be done only when pom.xml is present

```bash
mvn clean install
```

## Deploy springboot application:

```bash
cd target
java -jar gs-spring-boot-0.1.0.jar

# Run the application using nohup and &:
nohup java -jar gs-spring-boot-0.1.0.jar > output.log 2>&1 &
# List Java processes:
ps aux | grep java
jobs
# Stop the running application:

- If you started the application as a background job (e.g., with `nohup`):

```bash
jobs
kill %1
```

- Or, if you know the process ID (PID):

```bash
ps aux | grep java
kill -9 <PID>
```
Replace `<PID>` with the actual process ID shown in the output.

http://public-ip:8080
http://localhost:8080
```

## If you want to run ```Dockerfile-with-ARG-ENV file```

```bash
docker build -t springboothello:v1 -f Dockerfile-with-ARG-ENV . --build-arg version=0.1.0
```
