pipeline {

    agent { label 'linux' }

    environment {
    DOCKERHUB_CREDENTIALS = credentials('corchopelado-dockerhub')
    }

    stages {
        stage('build') {
            steps {
                echo "aqui clonamos el codigo del github y hacemos un docker build" /* <- agregar un docker file al github --- git pull, docker build, docker push*/
                git branch: 'main', credentialsId: 'ffdf64b0-a3ab-4ab3-9ad7-e58b95006af2', url: 'https://github.com/corchopelado/para-panch'
                sh 'usermod -aG docker jenkins'
                sh 'docker build -t estoesuntag .'
            }
        }

        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push') {
            steps {
                sh 'docker push corchopelado/para-panch:latest'
            }
        }

        stage('Deploy') {
            steps {
                echo "aqui nos conectamos al cluster de minikube y que ejecute la actualizacion del deployment file"
            }
        }
    }
}