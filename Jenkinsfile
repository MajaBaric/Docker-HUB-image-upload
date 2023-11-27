pipeline {
    agent any
    stages {
        stage ("Git checkout") {
            steps{
                git credentailsId: 'gitHUB', url: 'https://github.com/MajaBaric/Docker-HUB-image-upload.git'
                echo 'Git checkout completed'
            }
        }
    }
}