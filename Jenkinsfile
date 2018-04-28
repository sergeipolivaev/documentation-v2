pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''#!/usr/bin/bash
             . ~/.rvm/scripts/rvm && bundle exec jekyll build
        '''
        sh "docker build -t docker-registry.market.local/developer-documentation-v2:$BUILD_TAG ."
      }
    }
    stage('Publish') {
      steps {
        sh "docker push docker-registry.market.local/developer-documentation-v2:$BUILD_TAG"
      }
    }
  }
}
