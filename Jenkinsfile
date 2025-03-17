pipeline {
    agent any
    stages {
        stage ('GIT CHECKOUT') {
            steps {
                git url:'https://github.com/vickydevo/springboot-test.git', branch:'main'
            }
        }// stage1


          stage ('Quality Gates') {
            steps {
                sh '''
                mvn clean verfiy
                '''
            }
        }//stage2 
        stage ('SonarQube Analysis Gates') {
            steps {
                sh '''
                mvn clean complie
                '''
            }
        
        stage ('MAVEN BUILD Artifact') {
            steps {
                sh '''
                mvn clean package 
                '''
            }
        }//stage2 
        stage ('Artifact to Nexus Repo') {
            steps {
                sh '''
                mvn clean verfiy
                '''
            }
        
        stage ('DOCKER BUILD') {
            steps {
                sh '''
                docker build -t springboot-demo:v1 .
                docker tag springboot-demo:v1 vignan91/springboot-demo:v1
                echo "######################################"
                echo "     DOCKER TAG IS COMPLETED             "
                echo "######################################"
                '''
            }
        }// stage3
        stage ('Trivy Scan of Image') {
            steps {
                sh '''
                mvn clean validate
                '''
            }
        
        stage ('DOCKER LOGIN PUSH') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                    echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                    echo "######################################"
                    echo "     DOCKER LOGIN IS COMPLETED             "
                    echo "######################################"
                    docker push vignan91/springboot-demo:v1
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
                docker run -d -p 8081:8080 --name springboot-demo-container vignan91/springboot-demo:v1
                echo "######################################"
                echo "     DOCKER CONTAINER IS RUNNING ON PORT 8081             "
                echo "######################################"
                '''
            }
        }// stage5
    } //stages
}//pipeline close
