pipeline {
  agent any

  environment {
    WEB_HOST = "WEB_SERVER_IP_HERE"
    WEB_USER = "ec2-user"
  }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Test') {
      steps {
        sh 'chmod +x tests/test_html.sh'
        sh './tests/test_html.sh'
      }
    }

    stage('Deploy') {
      steps {
        sh '''
          scp -o StrictHostKeyChecking=no index.html ${WEB_USER}@${WEB_HOST}:/tmp/index.html
          ssh -o StrictHostKeyChecking=no ${WEB_USER}@${WEB_HOST} "sudo mv /tmp/index.html /var/www/html/index.html && sudo chown root:root /var/www/html/index.html && sudo chmod 644 /var/www/html/index.html"
        '''
      }
    }
  }
}
