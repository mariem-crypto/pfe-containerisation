pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Recuperation du code depuis GitHub...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Build des images Docker...'
                sh 'docker compose build'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Demarrage des containers...'
                sh 'docker compose down || true'
                sh 'docker compose up -d'
                sh 'sleep 10'
            }
        }

        stage('Tests') {
            steps {
                echo 'Execution des tests...'
                sh 'chmod +x tests/test_services.sh'
                sh 'bash tests/test_services.sh'
            }
        }

    }

    post {
        success {
            echo 'Pipeline reussi — tous les services sont operationnels !'
        }
        failure {
            echo 'Echec — arret des containers...'
            sh 'docker compose down || true'
        }
    }
}
