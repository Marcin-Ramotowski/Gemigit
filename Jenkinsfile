pipeline {
  agent any
  stages {
    stage("Build GO app") {
      steps {
        sh '''
          docker-compose up -d
          docker tag gemigit registry.byst.re/gemigit
          '''
      }
    }
    stage('Deploy') {
      steps {
        script {
            appImage = docker.image('registry.byst.re/gemigit')
            docker.withRegistry('https://registry.byst.re', '3c074810-ffdd-48a5-87c3-6f44051fca6d') {
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
