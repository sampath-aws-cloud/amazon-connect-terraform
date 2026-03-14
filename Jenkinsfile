pipeline {
    agent any
    stages {
        stage ('Terraform Init') {
            steps {
                bat 'cd terraform/dev & terraform init'
            }
        }
        stage ('Terraform Apply') {
            steps {
                bat 'cd terraform/dev & terraform apply -auto-approve'
            }
            
        }   
    }    
}