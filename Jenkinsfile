pipeline {
  agent any

  environment {
    IMAGE_NAME = "whodeepaksoni/app-java"
  }

  stages {

    stage('Code Checkout') {
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
        sh 'docker build -t java-app:latest .'
      }
    }

  }
}

