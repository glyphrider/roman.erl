pipeline {
  agent {
    docker {
      image 'library/erlang:19.3'
    }
  }
  
  stages {
    stage('Build') {
      steps {
        sh 'erlc -DTEST roman.erl'
      }
    }
    stage('Test') {
      steps {
        sh 'erl -noshell -s roman test -s init stop'
      }
    }
  }
}
