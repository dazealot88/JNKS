pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/dazealot88/JNKS.git'
                //checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/dazealot88/JNKS.git']]])
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
         stage('Terraform Apply') {
             steps {
               //  input 'Deploy to AWS?'
                 sh 'terraform apply -auto-approve'
             }
         }
         stage("Sleep 60"){
            steps{
                sleep time: 1, unit: 'MINUTES'
            }
         }
         stage('Terraform Destroy') {
             steps {
               //  input 'Destroy AWS resoureces'
                 sh 'terraform destroy -auto-approve'
             }
         }
    }
}




