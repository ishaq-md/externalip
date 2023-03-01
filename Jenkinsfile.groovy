pipeline {
    agent any

    environment {
    SVC_ACCOUNT_KEY = credentials('dev-auth')
  }
     
    stages {
      	stage('Set creds') {
            steps {
              
                sh 'echo $SVC_ACCOUNT_KEY | base64 -d > jenkins.json'
		            sh 'pwd' 
            }
        }

	
	stage('Auth-Project') {
	 steps {
		 
        sh 'gcloud auth activate-service-account jenkins@mi-dev-env.iam.gserviceaccount.com --key-file=jenkins.json'
       sh 'gcloud config set project mi-dev-env'
			 sh 'gcloud compute addresses list > addresses_ips.txt'
    }
    }
	
 	 
	stage('Run Script') {
	 steps {
    
    sh './script.sh'
        
    }
    }
  
   }
}
