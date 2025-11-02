pipeline {
    agent any

    // environment {
    //     MYSQLHOST = credentials('mysql.railway.internal')
    //     MYSQLPORT = credentials('3306')
    //     MYSQLDATABASE = credentials('railway')
    //     MYSQLUSER = credentials('root')
    //     MYSQLPASSWORD = credentials('VkPIZmExFPNVoVswTcLKdxQLEmCDnXlp')
    // }

    environment {
        MYSQLHOST = 'mysql.railway.internal'
        MYSQLPORT = '3306'
        MYSQLDATABASE = 'railway'
        MYSQLUSER = 'root'
        MYSQLPASSWORD = 'VkPIZmExFPNVoVswTcLKdxQLEmCDnXlp'
    }


    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/SK-HARI-01/Simple-Banking-System.git'
            }
        }

        stage('Build WAR with Maven') {
            steps {
                echo 'Building WAR package...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                sh 'mvn test'
            }
        }

        stage('Deploy WAR Locally') {
            steps {
                echo 'Deploying WAR...'
                // The WAR file is usually under target/*.war
                // If using embedded Tomcat:
                sh '''
                WAR_FILE=$(ls target/*.war | head -n 1)
                echo "Deploying $WAR_FILE"
                java -jar $WAR_FILE &
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Build and deployment completed successfully!'
        }
        failure {
            echo '❌ Build or deployment failed. Check logs.'
        }
    }
}
