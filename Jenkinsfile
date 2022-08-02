pipeline {
  environment {
    imageBaseName = "arm7tdmi/simple-flask-webapp"
  }
  agent {
    kubernetes {
      yaml """
kind: Pod
metadata:
  name: agent
spec:
  containers:
  - name: git
    image: alpine/git:v2.36.2
    imagePullPolicy: Always
    command:
    - cat
    tty: true
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    imagePullPolicy: Always
    command:
    - /busybox/cat
    tty: true
    volumeMounts:
      - name: kaniko-secret
        mountPath: /kaniko/.docker
  volumes:
  - name: kaniko-secret
    secret:
      secretName: regcred
      items:
      - key: .dockerconfigjson
        path: config.json
      """
    }
  }
  stages {
    stage('Checkout') {
      steps {
        container('git') {
          checkout scm
        }
      }
    }
    stage('Build & Push') {
      steps {
        container(name: 'kaniko', shell: '/busybox/sh') {
          sh "\
            /kaniko/executor \
            --git branch=main \
            --context=dir://${env.WORKSPACE} \
            --destination=${env.imageBaseName}:${env.BRANCH_NAME}-${env.BUILD_NUMBER} \
          "
        }
      }
    }
  }
}