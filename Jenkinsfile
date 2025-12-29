pipeline {
    agent any

    environment {
        IMAGE_NAME = "whodeepaksoni/java-app"
        IMAGE_TAG  = "latest"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t whodeepaksoni/java-app:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'whodeepaksoni',
                    passwordVariable: 'Deep@k123'
                )]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u whodeepaksoni --password-stdin
                    docker push whodeepaksoni/java-app:latest
                    '''
                }
            }
        }

        stage('Kubernetes Deploy') {
            steps {
                sh '''
                kubectl apply -f k8s/deployment.yaml
                kubectl rollout status deployment/java-app
                '''
            }
        }
    }
}

