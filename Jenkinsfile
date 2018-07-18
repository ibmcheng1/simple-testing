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
            withMaven(
		        // Maven installation declared in the Jenkins "Global Tool Configuration"
		        maven: 'M3',
		        // Maven settings.xml file defined with the Jenkins Config File Provider Plugin
		        // Maven settings and global settings can also be defined in Jenkins Global Tools Configuration
		        mavenSettingsConfig: 'my-maven-settings',
		        mavenLocalRepo: '.repository') {	
				    // Run the maven build
				    sh "mvn clean -P chrome,grid,localhost test"
	    		} // withMaven will discover the generated Maven artifacts, JUnit Surefire & FailSafe & FindBugs reports...
        }
        
    }
	
