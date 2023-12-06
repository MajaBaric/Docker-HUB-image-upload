pipeline {
    agent none

    stages {
        agent { label label:jenkins-test}
        stage ('Git checkout') {
            steps{
                git credentialsId: 'gitHUB', url: 'https://github.com/MajaBaric/Docker-HUB-image-upload.git'
                echo 'Git checkout completed'
            }
        }

        stage ('Build') {
            agent { label label:jenkins-test}
            steps {
                script {
                    sh 'docker build -t majabaric/llvm-build-image:0.1 .'
                    echo 'building llvm image done'
                }
            }
        }
    }
}
