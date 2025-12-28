pipeline {
  agent any

  environment {
    IMAGE_NAME = "whodeepaksoni/app-java"
  }

  stages {

    stage('Code Checkout') {
      steps {
        git 'https://github.com/whodeepaksoni/java-app'
      }
    }

    stage('Maven Build') {
      steps {
        sh 'mvn clean package'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t java-app:latest .'
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
          echo $PASS | docker login -u $USER --password-stdin
          docker push java-app:latest
          '''
        }
      }
    }

  }
}

