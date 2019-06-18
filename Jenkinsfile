pipeline {
	agent any
     stages {
	stage('build') {
                  steps {
                         echo "building successfull"
                         }
                       }   
         stage('test') {
                  steps {
			echo "testing Fibonacci file"
			  echo $SHELL
			 sh 'javac Fibonacci.java'
			}          
                         
                       }			  

}  
}	
