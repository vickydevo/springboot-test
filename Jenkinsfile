pipeline {
    agent any
    stages {
        stage ('GIT CHECKOUT') {
            steps {
                git url: 'https://github.com/vickydevo/springboot-test.git', branch: 'main'
            }
        } // stage 1

        stage ('Quality Gates') {
            steps {
                sh '''
                mvn clean verify
                '''
            }
        } // stage 2

        stage ('SonarQube Analysis Gates') {
            steps {
                sh '''
                mvn clean compile
                '''
            }
        } // stage 3

        stage ('MAVEN BUILD Artifact') {
            steps {
                sh '''
                mvn clean package
                '''
            }
        } // stage 4

        stage ('Artifact to Nexus Repo') {
            steps {
                sh '''
                   echo "######################################"
                    echo "     $(pwd)       "
                    echo "######################################"
                mvn clean verify
                pwd 
                '''
            }
        } // stage 5

        stage ('DOCKER BUILD') {
            steps {
                sh '''
                docker build -t springboot-demo:v2 .
                docker tag springboot-demo:v2 vignan91/springboot-demo:v2
                echo "######################################"
                echo "     DOCKER TAG IS COMPLETED         "
                echo "######################################"
                '''
            }
        } // stage 6

        stage ('Trivy Scan of Image') {
            steps {
                sh '''
                mvn clean validate
                echo "######################################"
                    echo "     $(pwd)       "
                    echo "######################################"
                '''
            }
        } // stage 7

        stage ('Image Push to Dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                    echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                    echo "######################################"
                    echo "     DOCKER LOGIN IS COMPLETED       "
                    echo "######################################"
                    docker push vignan91/springboot-demo:v2
                    echo "######################################"
                    echo "     DOCKER PUSH IS COMPLETED        "
                    echo "######################################"
                    '''
                }
            }
        } // stage 8

        stage ('Deploy app to Container') {
            steps {
                sh '''
                docker run -d -p 8082:8081 --name demo-container vignan91/springboot-demo:v2
                echo "######################################"
                echo "     DOCKER CONTAINER IS RUNNING ON PORT 8081 "
                echo "######################################"
                '''
            }
        } // stage 9
    } // stages
} // pipeline

