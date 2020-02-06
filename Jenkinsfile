@Library('shared-library')_
node {
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
        EKS_PROD_CLUSTER: params.EKS_PROD_CLUSTER,
        EKS_DEV_CLUSTER: params.EKS_DEV_CLUSTER,
        AWS_REGION: params.AWS_REGION,
        ECR_REPO: params.ECR_REPO,
        ECR_REPO_NAME: params.ECR_REPO_NAME,
        DEPLOYMENT_NAME: params.DEPLOYMENT_NAME,
        OPTION: params.OPTION
    )
}