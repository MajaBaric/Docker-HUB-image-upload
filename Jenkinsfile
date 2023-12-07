pipeline {
    agent none

    stages {
        stage ('Git checkout') {
            agent {
            docker {
                label 'label:jenkins-container-test'
            }
        }
            steps{
                git credentialsId: 'gitHUB', url: 'https://github.com/MajaBaric/Docker-HUB-image-upload.git'
                echo 'Git checkout completed'
            }
        }

        stage ('Build') {
            agent { 
                dockerfile {
                    filename 'Dockerfile'
                    dir 'build'
                }
            }
            steps {
                script {
                    sh 'docker build -t majabaric/llvm-build-image:0.1 .'
                    echo 'building llvm image done'
                }
            }
        }
    }
}
