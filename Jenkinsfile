pipeline {
  agent any
  environment {
    IMAGE_NAME = 'app2'
    CONTAINER_NAME = 'ecstatic_mclaren'
  }
  stages{
    stage('Checkout'){
      steps{
        git url: 'https://github.com/gladsonm934/app2.git', branch: 'main'
      }
    }
    stage('Build Docker Image'){
      steps{
        sh 'docker build -t $IMAGE_NAME .'
      }
    }
    stage('stop Existing Container'){
      steps{
        sh '''
        docker stop $CONTAINER_NAME || true
        docker rm $CONTAINER_NAME || true
        '''
      }
    }
    stage('Run Docker container'){
      steps{
        sh 'docker run -d --name $CONTAINER_NAME -p 8086:80 $IMAGE_NAME'
      }
    }
  }
  post{
    success{
      echo "app2 deployed :http://localhost:8086"
    }
    failure{
      echo "Deployment failed"
    }
  }
}
