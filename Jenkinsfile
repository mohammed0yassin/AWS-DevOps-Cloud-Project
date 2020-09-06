pipeline {
  agent any
  stages {
    stage("Lint HTML") {
      steps {
        sh 'tidy -q -e --drop-empty-elements no ./web/*.html'  
      }
    }
    
    stage("Build Docker image") {
      steps {
        sh 'docker build -t webserver:1.0 .'  
      }
    }

    stage("Push Dcoker image") {
      steps {
        withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
          sh 'dockerpath=yassin226/webserver'  
          sh 'docker login'  
          sh 'docker tag webserver:1.0 $dockerpath'  
          sh 'docker push $dockerpath'  
        }
      }
    }

    stage('Deploy Container') {
      steps {
        withAWS(region:'us-east-2',credentials:'aws-devops-credentials') {
          sh 'aws eks update-kubeconfig --name devops-capstone-cluster'
          sh 'kubectl config use-context arn:aws:eks:us-east-1:559944449460:cluster/devops-capstone-cluster'
          sh 'kubectl apply -f deployment/deployment.yml'

        }
      }
    }

  }
}