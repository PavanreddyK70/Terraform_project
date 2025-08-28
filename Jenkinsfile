pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Checkout') {
            steps {
                echo "Pulling code from GitHub"
                git branch: 'main', url: 'https://github.com/PavanreddyK70/Terraform_project'
            }
        }
        stage('Terraform Init') {
            steps {
                echo "Initializing Terraform"
                sh 'yes yes | terraform init -migrate-state'
            }
        }
        stage("Terraform Validate"){
            steps{
                echo "Validating the syntax"
                sh "terraform validate"
            }
        }
        stage("Terraform Plan") {
            steps {
                echo "Dry run - showing what will be created"
                sh "terraform plan"
            }
        }
        stage("Terraform Apply") {
            steps {
                echo "Creating the infrastructure"
                sh "terraform apply -auto-approve"
            }
        }
    }
}
