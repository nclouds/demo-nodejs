node{
  commit = "";
  prod = "";
  stage('Checkout') {
    git url: 'https://github.com/nclouds/demo-nodejs.git', branch: 'master'
    commit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
  }
  stage('Build') {
      container('docker') {
          script {
            sh 'docker --version'
            //sh 'helm version'
            sh "docker build -t shariq-test --network=host ."
            sh "\$(aws ecr get-login --no-include-email --region us-east-1)"
            sh "docker tag shariq-test 695292474035.dkr.ecr.us-east-1.amazonaws.com/shariq-test:${commit}"
            sh "docker tag shariq-test 695292474035.dkr.ecr.us-east-1.amazonaws.com/shariq-test:latest"
            sh "docker push 695292474035.dkr.ecr.us-east-1.amazonaws.com/shariq-test:${commit}"
            sh "docker push 695292474035.dkr.ecr.us-east-1.amazonaws.com/shariq-test:latest"

          }
      }
  }
  stage('Test') {
    echo "testing ..."
  }
  stage('Vulnerability Scanner') {
    echo "testing ..."
  }
  stage('Deployment') {
    echo "Deployment ..."
    container('docker') {
        script {
            sh "aws eks update-kubeconfig --name nclouds-eks-dev --region us-east-1"
            sh "kubectl set image deployment/ecsdemo-nodejs ecsdemo-nodejs=695292474035.dkr.ecr.us-east-1.amazonaws.com/shariq-test:${commit} --record"
        }
    }
  }
}