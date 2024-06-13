pipeline {
      agent any
        stages {
            stage('build docker image') {
                 steps {
                    sh '''
			echo "ok"
                    '''
                    }}
    }

    post {
        always {
        cleanWs()
        }
    }
    }
