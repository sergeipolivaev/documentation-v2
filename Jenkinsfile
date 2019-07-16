pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh "docker run --rm -e \"JEKYLL_UID=\$(id -u jenkins)\" -e \"JEKYLL_GID=\$(id -g jenkins)\" --volume=\"${env.WORKSPACE}:/srv/jekyll\" jekyll/builder:3.8 jekyll build"
        sh "docker build -t docker-registry.market.local/developer-documentation-v2:$BUILD_TAG ."
      }
    }
    stage('Publish') {
      steps {
        sh "docker push docker-registry.market.local/developer-documentation-v2:$BUILD_TAG"
      }
    }
    stage('Deploy to Test') {
      when {
        environment name: 'type', value: 'test'
      }
      steps {
        sh """helm upgrade --install \
          --kube-context test-cluster \
          --namespace test \
          --values ./helm/values/test.yaml \
          --set image.tag=$BUILD_TAG \
          --wait \
          dev-docs-v2 \
          ./helm/dev-docs-v2
        """
      }
    }
    stage('Deploy to Prod') {
      when {
        environment name: 'type', value: 'prod'
      }
      steps {
        sh """helm upgrade --install \
          --kube-context prod-cluster \
          --namespace prod \
          --values ./helm/values/prod.yaml \
          --set image.tag=$BUILD_TAG \
          --wait \
          dev-docs-v2 \
          ./helm/dev-docs-v2
        """
      }
    }
  }
}
