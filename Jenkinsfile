pipeline {
      agent any
            environment {
                 tag_absolute = false
                }
        stages {
            stage('build docker image') {
                 steps {
                    sh '''
                    hash=$(git rev-parse HEAD)
                    tag=$(git tag --contains $hash)
                    if [[ ! -z "${tag}" ]]
                    then
                    echo tag_absolute = true > env.property

                    echo $tag > ./tag
                    else
                    tag=$(git tag --sort=-creatordate | head -n 1)
                    echo $tag > ./tag
                    fi
                    docker build -t ivannikita/netrology_diplom:$tag .
                    echo ${env.TAG_NAME}
                    '''
                    }

                    }
            stage('push docker image') {
                steps {
                    sh '''
                    tag=$(cat ./tag)
                    echo $tag
                    docker push ivannikita/netrology_diplom:$tag
                    '''
                    }
    }
            stage('push to kuber') {
                when {
                   expression {
                    return env.TAG_NAME != null
                    }
                }
                steps {
                    sh '''
                    echo ${env.TAG_NAME}
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

