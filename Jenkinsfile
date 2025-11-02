pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/SK-HARI-01/Simple-Banking-System.git'
            }
        }

        stage('Build WAR with Maven') {
            steps {
                echo 'Building WAR package...'
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running unit tests...'
                bat 'mvn test'
            }
        }

        stage('Deploy WAR Locally') {
            steps {
                echo 'Deploying WAR to Tomcat...'
                bat '''
                copy target\\*.war C:\\path\\to\\tomcat\\webapps\\
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Build and Deployment Successful!'
        }
        failure {
            echo '❌ Build or deployment failed. Check logs.'
        }
    }
}
