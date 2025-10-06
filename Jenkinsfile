pipeline {
    agent any

    environment {
        IMAGE_NAME = 'saucelabs-cypress:latest'
    }

   stages {
       stage('Checkout') {
           steps {
  	        checkout scm
           }
       }

       stage('Build Docker Image') {
           steps {
		    sh 'docker build -t $IMAGE_NAME .'
	       }
       }

      stage('Run Cypress Tests in Docker and generate report') {
          steps {
	        sh 'docker run --rm -v $PWD/cypress/reports:/app/cypress/reports $IMAGE_NAME'
	      }
      }

     stage('Archive Reports') {
         steps {
              archiveArtifacts artifacts: 'cypress/reports/html/**', allowEmptyArchive: true
         }
     }
   }
}
