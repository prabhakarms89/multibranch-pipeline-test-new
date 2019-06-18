pipeline {
	agent any
	env.JAVA_HOME = tool 'JDK1.8.0_201'
	env.PATH = "${env.JAVA_HOME}/bin:"

     stages {
	stage('build') {
                  steps {
                         echo "building successfull"
                         }
                       }   
         stage('test') {
                  steps {
			echo "testing Fibonacci file"
			 
			 sh 'javac Fibonacci.java'
			  sh 'java Fibonacci'
			}          
                         
                       }			  

}  
}	
