    node {
        def gitCommit
        stage ('Extract') {
          checkout scm
          gitCommit = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
          echo "checked out git commit ${gitCommit}"
        }
 
        stage ('Environment Info ...') {		
            def imageTag = null
            imageTag = gitCommit
            sh """
            #!/bin/bash
		    pwd
		    ls -l
	        echo "imageTag: ${imageTag}"
	        echo "BUILD_NUMBER: ${BUILD_NUMBER}"
		    echo "WORKSPACE: ${WORKSPACE}"
	        """          				
		} 
		  
		stage('Build') { 
            sh 'mvn clean -P chrome,grid,localhost test'
        }
    }
	
