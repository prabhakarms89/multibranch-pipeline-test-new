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
			 
			 sh 'javac -classpath ".:$/usr/lib/java" $Fibonacci.java'
			}          
                         
                       }			  

}  
}	
