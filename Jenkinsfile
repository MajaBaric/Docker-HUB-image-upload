pipeline {
    agent any

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
                    sh 'docker build -t majabaric/llvm-build-image:0.1 .'
                    echo 'building llvm image done'
                }
            }
        }

        stage('Build llvm') {
            agent {
                docker {
                    image 'majabaric/llvm-build-image:0.1'
                }
            }
            steps {
                sh 'docker exec -it majabaric/llvm-build-image:0.1'
                echo 'I am in the Build stage'
                sh 'cd clang-worning'
                sh 'mkdir build'
                sh 'cd build'
                sh 'cmake -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../llvm'
                sh 'make'
            }
        }
    }
}