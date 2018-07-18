    node {
        def gitCommit
        stage ('Extract') {
          checkout scm
          gitCommit = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
          echo "checked out git commit ${gitCommit}"
        }
 
        stage ('maven build...') {		
            def imageTag = null
            imageTag = gitCommit
            sh """
            #!/bin/bash
		    pwd
		    ls -l
	        echo "imageTag: ${imageTag}"
	        echo "BUILD_NUMBER: ${BUILD_NUMBER}"
		    echo "WORKSPACE: ${WORKSPACE}"
		    echo "Run maven build"
		    mvn clean -P chrome,grid,localhost test
	        """          				
		}     	    

    }
	
