pipeline {
environment {
    registry = 'choiaw1991/aetna_application'
    registryCredential = 'dockerhub'
    dockerImage = ''
  } 
  agent { label 'bsafe_node' } 
  stages {
   stage('Cloning Git') {
      steps {
        git([url:  'https://github.com/ChoiAW1991/Capstone_BSafe', branch: 'main', credentialsId: ''])
      }
    }

    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
             dockerImage.push()
          }
        }
      }
    }

    stage('Start Container') {
      steps{
        script {
          sh "docker run -d -p 3000:3000 --name aetna_application choiaw1991/aetna_application:$BUILD_NUMBER"
        }
      }
    }
   
    stage('Test Application') {
      steps{
        script {
          sh "npm test"
        }
      }
    }
 
    stage('Delete Container') {
      steps{
        script {
          sh "docker stop aetna_application"
          sh "docker image rmi choiaw1991/aenta_application:$BUILD_NUMBER"
        }
      }
    }
      
  }
}
