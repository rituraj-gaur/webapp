pipeline {
    agent any
    tools { 
        maven 'M3'
    }
    environment {
        PATH = "/home/thanos/.local/bin/:$PATH"
      }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "The path is now:"
                    echo $PATH
                ''' 
            }
        }
        stage ('Check-secrets') {
                    steps {
                        sh "rm truffle-log || true"
                        //sh "trufflehog --json https://github.com/rituraj-gaur/webapp.git > truffle-log"
                        sh "docker run gesellix/trufflehog --json  https://github.com/rituraj-gaur/webapp.git > truffle"
                    }
                }
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    } 
}
