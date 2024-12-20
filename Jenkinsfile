pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'eu-north-1'  // Set your AWS region here
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')  // Use the ID you assigned to AWS credentials
        AWS_SECRET_ACCESS_KEY = credentials('aws-access-key-id')  // Use the same ID for the secret key
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the GitHub repository
                git branch: 'main', url: 'https://github.com/vikrantyadav1996/Autoscalling.git'
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform (downloads plugins, etc.)
                bat 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Run terraform plan to see what changes will be made
                bat 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply the changes
                bat 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        always {
            // Clean workspace after running Terraform
            cleanWs()
        }
    }
}
