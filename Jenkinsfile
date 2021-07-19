pipeline {
    agent any
    tools { 
        maven 'M3'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                ''' 
            }
        }
        stage ('Check-secrets') {
                    steps {
                        sh "rm truffle-log || true"
                        sh "/home/thanos/.local/bin/trufflehog --json https://github.com/rituraj-gaur/webapp.git > truffle-log"
                    }
                }
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    } 
}
