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
                    echo "The workspace path is now:"
                    echo $WORKSPACE
                ''' 
            }
        }
        stage ('Check-secrets') {
                    steps {
                        sh "rm truffle-log || true"
                        //sh "trufflehog --json https://github.com/rituraj-gaur/webapp.git > truffle-log"
                        sh "docker run gesellix/trufflehog --json  https://github.com/rituraj-gaur/webapp.git > truffle-log"
                        sh "cat truffle-log"
                    }
                }
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage ('Source-Composition-Analysis') {
        		steps {
        		     sh 'rm owasp-* || true'
        		     sh "echo `whoami`"ENK
        		     sh 'echo FIND ME'
        		     sh 'wget https://raw.githubusercontent.com/rituraj-gaur//webapp/master/owasp-dependency-check.sh'
        		     sh 'chmod +x owasp-dependency-check.sh'
        		     sh 'bash owasp-dependency-check.sh'
        		     sh 'cat /var/lib/jenkins/OWASP-Dependency-Check/reports/dependency-check-report.xml'
        		}
        	}
    } 
}
