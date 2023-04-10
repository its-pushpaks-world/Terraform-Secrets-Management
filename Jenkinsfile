pipeline {
    agent any
    tools {
        terraform 'terraform'
        }  

    parameters {
		      choice name:'Terraform_Cleanup', description:"What should be done?", choices:['NO','FULL', 'PARTIAL']
			booleanParam name:"Terraform_Init", description:"Do you want to execute Terraform Init?", defaultValue:true
			booleanParam name:"Terraform_Plan", description:"Do you want to execute Terraform Plan?", defaultValue:true
			booleanParam name:"Terraform_Apply", description:"Do you want to execute Terraform Apply?", defaultValue:true
			booleanParam name:"Terraform_Destroy", description:"Do you want to execute Terraform Destroy?", defaultValue:false   			
               }
  

    stages {

        stage('Full Cleanup') {
            
            when { expression { return params.Terraform_Cleanup == 'FULL' } }

            steps {
                echo "----------------- Cleaning .Terraform files and state files locally -----------------"
                input('Full Terraform Deletion in progress, do you want to proceed?')
                sh '''
                ls -lart
                rm -rf .terraform*
                rm -rf terraform.*
                ls -lart
                '''
            }}
            
        stage('Partial Cleanup') {
            
            when { expression { return params.Terraform_Cleanup == 'PARTIAL' } }

            steps {
                echo "----------------- Cleaning .Terraform files locally -----------------"
                input('Partial Terraform Deletion in progress, do you want to proceed?')
                sh '''
                ls -lart
                rm -rf .terraform*
                ls -lart
                '''
            }}

        /*stage('Git Clone') {

            when { expression { return params.Git_Clone } }

            steps {
               echo "----------------- Cloning Git Repository -----------------"
               git branch: 'main', credentialsId: 'gitCredentials', url: 'https://github.com/its-pushpaks-world/Terraform-Secrets-Management'
            }}*/
            
       stage('Terraform Init') {

            when { expression { return params.Terraform_Init } }

            steps {
                echo "----------------- Initialising using TERRAFORM INIT -----------------"
                sh 'terraform init'
               }
            }
            
        
        stage('Terraform Plan') {
            
            when { expression { return params.Terraform_Plan } }
            
            steps {
                echo "----------------- Dry run using TERRAFORM PLAN -----------------"
                sh 'terraform plan'
            }}
            
        stage('Terraform Apply') {
            
            when { expression { return params.Terraform_Apply } }

            steps {
                echo "----------------- Creating Infrastructure using TERRAFORM APPLY -----------------"
                sh 'terraform apply --auto-approve'
            }}
            
         stage('Terraform Destroy') {

            when { expression { return params.Terraform_Destroy } }

            steps {
                echo "----------------- Destroying Infrastructure using TERRAFORM DESTROY -----------------"
                sh 'terraform destroy --auto-approve'
            }}       
        
        
    }
}
