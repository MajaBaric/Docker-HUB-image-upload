pipeline {
    agent any

    environment {
        DOCKER_HOME = "/usr/bin"  
    }

    stages {
        stage ('Git checkout') {
            steps{
                git credentialsId: 'gitHUB', url: 'https://github.com/MajaBaric/Docker-HUB-image-upload.git'
                echo 'Git checkout completed'
            }
        }

        stage ('Build') {

            steps {
                script {
                    def dockerCommand = "${DOCKER_HOME}/docker"
                    sh 'docker build -t majabaric/llvm-build-image:0.1 .'
                    echo 'building llvm image done'
                }
            }
        }
    }
}