

    node {
        def gitCommit
        stage ('Extract') {
          checkout scm
          gitCommit = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
          echo "checked out git commit ${gitCommit}"
        }
        stage ('maven build') {
        
          gitCommit = sh(script: 'mvn clean -P chrome,grid,localhost test', returnStdout: true).trim()
          //container('maven') {
          //  sh '''
          //  mvn clean -P chrome,grid,localhost test
          //  '''
          //}
        }
 
    }

