pipeline {
    agent{
        docker { image 'docker' }
    }
    stages {
        stage('build') {
            steps {
                echo "aqui clonamos el codigo del github y hacemos un docker build" /* <- agregar un docker file al github --- git pull, docker build, docker push*/
                git branch: 'main', credentialsId: 'ffdf64b0-a3ab-4ab3-9ad7-e58b95006af2', url: 'https://github.com/corchopelado/para-panch'
                sh 'docker version'
            }
        }
        stage('Deploy') {
            steps {
                echo "aqui nos conectamos al cluster de minikube y que ejecute la actualizacion del deployment file"
            }
        }
    }
}
