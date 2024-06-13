pipeline {
      agent any
        stages {
            stage('build docker image') {
                 steps {
                    sh '''
                    hash=$(git rev-parse HEAD)
                    tag=$(git tag --contains $hash)
                    if [[ ! -z "${tag}" ]]
                    then
                    echo $tag > ./tag
                    else
                    tag=$(git tag --sort=-creatordate | head -n 1)
                    echo $tag > ./tag
                    fi
                    docker build -t ivannikita/netrology_diplom:$tag .
                    '''
                    }

                    }
            stage('push docker image') {
                steps {
                    sh '''
                    tag = $(cat ./tag)
                    name="ivannikita/netrology_diplom:$tag"
                    echo $name
                    #docker push $name
                    '''
                    }
    }
            stage('push to kuber') {
                steps {
                    sh '''
                    tag=$(cat ./tag)
                    echo $tag
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
