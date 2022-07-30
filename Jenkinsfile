pipeline {
  environment {
    imageBaseName = "arm7tdmi/simple-flask-webapp"
    regCred = 'dockerhub'
    dockerImage = ''
  }
  agent {
    kubernetes {
      defaultContainer 'jnlp'
      yamlFile 'agent-pod.yaml'
    }
  }
  stages {
    stage('Checkout Repository') {
      steps {
        container('git'){
          git([url: 'https://github.com/cure4itches/simple-flask-app', branch: 'main'])
        }
      }
    }

    stage('Build Image') {
      steps{
        container('docker'){
          script {
            dockerImage = docker.build imageBaseName
          }
        }
      }
    }
    stage('Push Image') {
      steps{
        container('docker'){
          script {
            docker.withRegistry( '', regCred ) {
              dockerImage.push("$BUILD_NUMBER")
              dockerImage.push('latest')
            }
          }
        }
      }
    }
    stage('Clean Up') {
      steps{
        container('docker'){
          sh "docker rmi $imageBaseName:$BUILD_NUMBER"
          sh "docker rmi $imagename:latest"
        }
      }
    }
  }
}