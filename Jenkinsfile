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
                    touch build_approve

                    echo $tag > ./tag
                    else
                    tag=$(git tag --sort=-creatordate | head -n 1)
                    echo $tag > ./tag
                    fi
                    docker build -t ivannikita/netrology_diplom:$tag .
                    echo env.TAG_NAME
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
                    expression { return fileExists ('./build_approve') }
                }
                steps {
                    git branch: 'main', credentialsId: '6487bf99-5ef7-4876-a3ae-fb89674817c4', url: 'https://github.com/ivannikita/neto_diplom.git'
                    sh '''
                    tag=$(cat ./tag)
                    echo $tag
                    sed -i 's/:v.*/:$tag/g' ./kuber_my/deployment_app.yaml
                    kubectl apply -f ./kuber_my/deployment_app.yaml
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

