pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''#!/usr/bin/bash
             . ~/.rvm/scripts/rvm && bundle exec jekyll build
        '''
      }
    }
    stage('Deploy') {
      steps {
        sh '''#!/usr/bin/bash
              set -e
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
