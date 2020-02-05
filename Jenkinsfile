properties([parameters([
                        string(name: 'EKS_PROD_CLUSTER', defaultValue: 'nclouds-eks-prod'),
                        string(name: 'EKS_DEV_CLUSTER', defaultValue: 'nclouds-eks-dev'),
                        string(name: 'AWS_REGION', defaultValue: 'us-east-1'),
                        string(name: 'ECR_REPO', defaultValue: '695292474035.dkr.ecr.us-east-1.amazonaws.com/nclouds-eks-nodejs'),
                        string(name: 'ECR_REPO_NAME', defaultValue: 'nclouds-eks-nodejs'),
                        string(name: 'DEPLOYMENT_NAME', defaultValue: 'ecsdemo-nodejs'),
                        string(name: 'OPTION', defaultValue: 'prod-deploy')
                        ])])
@Library('shared-library')_
sharedPipeline()