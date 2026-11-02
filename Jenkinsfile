
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Récupération du code source...'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Construction de l'image Docker..."
                sh 'docker build -t mon-site-jenkins .'
            }
        }

        stage('Test & Run') {
            steps {
                echo 'Lancement du conteneur pour vérification...'
                sh 'docker run -d -p 9090:80 --name test-jenkins mon-site-jenkins'
                sh 'sleep 2'
                sh 'curl -fsS http://localhost:9090 | grep -F "Hello depuis Docker et Jenkins"'
                echo 'Test réussi ! Le site répond correctement.'
            }
        }
    }

    post {
        always {
            echo 'Nettoyage des conteneurs de test...'
            sh 'docker stop test-jenkins || true'
            sh 'docker rm test-jenkins || true'
        }
    }
}
