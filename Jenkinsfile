pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git branch: 'main', url: 'https://github.com/dazealot88/JNKS.git'
            }
        }
        stage('Checkov') {
            steps {
                // Verify Checkov installation
                sh '/var/lib/jenkins/.local/bin/checkov --version'
                // Print the workspace directory
                sh 'echo ${WORKSPACE}'
                // Run Checkov and output results in JUnit XML format
                sh '/var/lib/jenkins/.local/bin/checkov -d . -o junitxml --output-file-path console'
                // Publish the Checkov results
                junit 'console/*.xml'
            }
        }
        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                // Generate and show Terraform execution plan
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                // Apply the Terraform plan to create/update infrastructure
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Sleep 60') {
            steps {
                // Pause the pipeline for 60 seconds
                sleep time: 1, unit: 'MINUTES'
            }
        }
        stage('Terraform Destroy') {
            steps {
                // Destroy the Terraform-managed infrastructure
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
