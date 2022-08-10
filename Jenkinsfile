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
             post{
                always{
                    junit '**/target/surefire-reports/TEST-*.xml'
                }
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
            bat 'docker-compose -f docker-compose.yaml up'
            bat 'docker push aeramzy9/pet-clinic:3.0'
            }
            }
        }

    }
}
