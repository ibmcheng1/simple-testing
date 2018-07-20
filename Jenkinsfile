

    node ('icp-ibmcheng1-build') {
        def gitCommit
        stage ('Extract') {
          checkout scm
          gitCommit = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
          echo "checked out git commit ${gitCommit}"
        }
        stage ('maven build') {
          //container('maven') {
            sh '''
            mvn clean -P chrome,grid,localhost test
            '''
          //}
        }
 
    }

