pipeline {
      agent any
        stages {
            stage('build docker image') {
                 steps {
                    sh '''
                    docker build -t ivannikita/netrology_diplom:v0.4 .
                    '''
                    }
                 steps {
                    sh '''
                    docker push ivannikita/netrology_diplom:v0.4
                    '''
                    }
                    }
    }


    post {
        always {
        cleanWs()
        }
    }
    }
