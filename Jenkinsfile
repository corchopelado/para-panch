pipeline {

    agent{
        docker { image 'docker:20.10.17-dind' }
    }

    environment {
    DOCKERHUB_CREDENTIALS = credentials('corchopelado-dockerhub')
    }

    stages {
        stage('build') {
            steps {
                echo "aqui clonamos el codigo del github y hacemos un docker build" /* <- agregar un docker file al github --- git pull, docker build, docker push*/
                git branch: 'main', credentialsId: 'ffdf64b0-a3ab-4ab3-9ad7-e58b95006af2', url: 'https://github.com/corchopelado/para-panch'
                sh 'docker --version'
                sh 'docker build -t corchopelado/para-panch:${BUILD_NUMBER} .'
            }
        }

        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push') {
            steps {
                sh 'docker push corchopelado/para-panch:${BUILD_NUMBER}'
            }
        }

        stage('Deploy') {
            steps {
                echo "aqui nos conectamos al cluster de minikube y que ejecute la actualizacion del deployment file"
                sh 'sed -i -e "s/%TAG%/${BUILD_NUMBER}/g" deplo-panch'
                sh 'cat deplo-panch'
                sh 'kubectl apply -f deploy-panch'

            }
        }
    }
}