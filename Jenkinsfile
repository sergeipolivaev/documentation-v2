pipeline {
  agent any
  stages {
    stage('Build [develop]') {
      when {
        environment name: "GIT_BRANCH", value: "origin/develop"
      }
      steps {
        sh "docker run --rm -e \"JEKYLL_UID=\$(id -u jenkins)\" -e \"JEKYLL_GID=\$(id -g jenkins)\" --volume=\"${env.WORKSPACE}:/srv/jekyll\" jekyll/builder:3.8 jekyll build"
        sh "docker build -t docker-registry.market.local/developer-documentation-v2:$BUILD_TAG ."
      }
    }
    stage('Publish [develop]') {
      when {
        environment name: "GIT_BRANCH", value: "origin/develop"
      }
      steps {
        sh "docker push docker-registry.market.local/developer-documentation-v2:$BUILD_TAG"
      }
    }
    stage('Deploy to Test [develop]') {
      when {
        environment name: "GIT_BRANCH", value: "origin/develop"
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
    stage('Deploy to Prod [develop]') {
      when {
        environment name: "GIT_BRANCH", value: "origin/develop"
      }
      steps {
        sh """helm upgrade --install \
          --kube-context prod-cluster \
          --namespace prod \
          --values ./helm/values/develop.yaml \
          --set image.tag=$BUILD_TAG \
          --wait \
          dev-docs-v2 \
          ./helm/dev-docs-v2
        """
      }
    }
    stage('Build [EVOADMIN-1298-JEKYLL-DOCKER-BUILD]') {
      when {
        environment name: "GIT_BRANCH", value: "origin/EVOADMIN-1298-JEKYLL-DOCKER-BUILD"
      }
      steps {
        sh "docker run --rm -e \"JEKYLL_UID=\$(id -u jenkins)\" -e \"JEKYLL_GID=\$(id -g jenkins)\" --volume=\"${env.WORKSPACE}:/srv/jekyll\" jekyll/builder:3.8 jekyll build"
      }
    }
    stage('Deploy [EVOADMIN-1298-JEKYLL-DOCKER-BUILD]') {
      when {
        environment name: "GIT_BRANCH", value: "origin/EVOADMIN-1298-JEKYLL-DOCKER-BUILD"
      }
      steps {
        sh '''set -e
              arch=docs_v2_${BUILD_TIMESTAMP}.tgz
              tar -czf ${arch} --exclude-from=tar_exclude -C _site .
              echo "Deploing to ${SERVER_NAME}..."
              scp ${arch} ${SERVER_USER}@${SERVER_NAME}:/srv/www/docs-v2-arch
              ssh -T ${SERVER_USER}@${SERVER_NAME}  << EOF
                cd /srv/www/docs-v2
                rm -rf /srv/www/docs-v2/*
                tar xzf /srv/www/docs-v2-arch/${arch}
                find /srv/www/docs-v2-arch/ -name "docs_v2_*" -mtime +60 -exec rm {} \\;
EOF
              rm ${arch}
        '''
      }
    }
  }
}
