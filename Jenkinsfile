pipeline {
  agent any 
  stages {
    stage('Build') {
      steps {
        sh "mvn compile"
      }
    }  
    stage('Test') {
      steps {
        sh "mvn test"
      }
     post {
      always {
        junit 'maven/target/surefire-reports/TEST*.xml'
      }
     }
  }
        stage('newman') {
            steps {
                sh 'newman run postman/postman_collection.json --environment postman/postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit 'postman/newman/*xml'
                    }
                }
        }
 }
}
