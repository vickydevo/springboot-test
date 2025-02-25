pipeline {
    agent any
    stages {
        stage ('GIT CHECKOUT') {
            steps {
                git url:'https://github.com/vickydevo/springboot-hello.git', branch:'main'
            }
        }// stage1
        
        stage ('MAVEN BUILD') {
            steps {
                sh '''
                mvn clean install
                '''
            }
        }//stage2 
        
        stage ('DOCKER BUILD') {
            steps {
                sh '''
                docker build -t spring-boot:v1 .
                docker tag spring-boot:v1 vignan91/spring-boot:v1
                echo "######################################"
                echo "     DOCKER TAG IS COMPLETED             "
                echo "######################################"
                '''
            }
        }// stage3
        
        stage ('DOCKER LOGIN PUSH') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                    echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                    echo "######################################"
                    echo "     DOCKER LOGIN IS COMPLETED             "
                    echo "######################################"
                    docker push vignan91/spring-boot:v1
                    echo "######################################"
                    echo "     DOCKER PUSH IS COMPLETED             "
                    echo "######################################"
                    '''
                }
            }
        }// stage4

        stage ('DOCKER RUN') {
            steps {
                sh '''
                docker run -d -p 8081:8080 --name spring-boot-container vignan91/spring-boot:v1
                echo "######################################"
                echo "     DOCKER CONTAINER IS RUNNING ON PORT 8081             "
                echo "######################################"
                '''
            }
        }// stage5
    } //stages
}//pipeline close
