pipeline {
  agent any
  stages {
    stage("Build GO app") {
      steps {
        sh '''
          docker-compose up -d
          docker tag gemigit <jenkins_url>/gemigit
          '''
      }
    }
    stage('Deploy') {
      steps {
        script {
            appImage = docker.image('<jenkins_url>/gemigit')
            docker.withRegistry('<jenkins_url>', '<credentials-id>') {
              appImage.push('latest')
          }
        }
      }
      post {
        always {
          sh 'docker-compose down'
        }
      }
    }
  }
}
