pipeline {
environment {
    registry = 'choiaw1991/aetna_application'
    registryCredential = 'dockerhub'
    dockerImage = ''
  } 
  agent any 
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
          sh "docker run -d -p 3000:3000 choiaw1991/aetna_application:$BUILD_NUMBER"
        }
      }
    }
    
  }
}
