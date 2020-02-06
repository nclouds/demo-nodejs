@Library('shared-library')_
pipeline {
    agent any
    parameters {
            string(name: 'EKS_PROD_CLUSTER', defaultValue: 'nclouds-eks-prod', description: 'The name of the eks prod cluster')
            string(name: 'EKS_DEV_CLUSTER', defaultValue: 'nclouds-eks-dev', description: 'The name of the eks dev cluster')
            string(name: 'AWS_REGION', defaultValue: 'us-east-1', description: 'region to be deployed')
            string(name: 'ECR_REPO', defaultValue: '695292474035.dkr.ecr.us-east-1.amazonaws.com/nclouds-eks-nodejs', description: 'Full ECR repo base image uri')
            string(name: 'ECR_REPO_NAME', defaultValue: 'nclouds-eks-nodejs', description: 'ECR repo name')
            string(name: 'DEPLOYMENT_NAME', defaultValue: 'ecsdemo', description: 'Deployment name in Kubernetes Deployment File')
            choice(name: 'OPTION', defaultValue: 'prod-deploy', choices: ['build', 'test', 'dev-deploy', 'prod-deploy'])
    }

    sharedPipeline(
        EKS_PROD_CLUSTER: 'nclouds-eks-prod',
        EKS_DEV_CLUSTER: 'nclouds-eks-dev',
        AWS_REGION: 'us-east-1',
        ECR_REPO: '695292474035.dkr.ecr.us-east-1.amazonaws.com/nclouds-eks-nodejs',
        ECR_REPO_NAME: 'nclouds-eks-nodejs',
        DEPLOYMENT_NAME: 'ecsdemo-nodejs',
        OPTION: 'prod-deploy'
    )
}