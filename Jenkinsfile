pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        S3_BUCKET_NAME = 'prasanthkumarr'
        TF_STATE_KEY = 'terraform/ec2.tfstate'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init -backend-config="bucket=${S3_BUCKET_NAME}" -backend-config="key=${TF_STATE_KEY}"'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            script {
                // Cleanup: Optionally, you can destroy the resources after testing
                // sh 'terraform destroy -auto-approve'
            }
        }
    }
}
