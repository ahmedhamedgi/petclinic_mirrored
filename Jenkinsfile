pipeline {
    agent any
    stages {
        stage("build jar") {
            steps {
                script {
                    echo "building jar"
                    bat "mvn clean install"
                }
            }
        }
        stage('Test Application') {
            steps {
                echo 'Testing Petclinic Application'
                bat 'mvn test'
            }
        }
        stage('Build Docker Image') {
            when {
                branch 'main'
            }
            steps {
            echo "building the docker image..."
            withCredentials([usernamePassword(credentialsId:'docker-for-jenkins',passwordVariable:'PASS',usernameVariable:'USER')]){
            bat "docker login -u $USER -p $PASS"
            bat 'docker build -t aeramzy9/pet-clinic:1.0 .'
            bat 'docker push aeramzy9/pet-clinic:tagname'
            }
            }
        }

    }
}
