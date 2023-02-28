pipeline {
    agent any


    environment {
    SVC_ACCOUNT_KEY = credentials('dev-auth')
  }

		stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                }
                sh 'echo $SVC_ACCOUNT_KEY | base64 -d > dev.json'
		sh 'pwd'
                sh 'terraform --version'               
               
            }
        }
        
         stage('Initialize Terraform') {
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
			
                sh 'terraform apply -auto-approve'
			 
		 }
	}
                             
}
}
