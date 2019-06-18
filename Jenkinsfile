node {
	agent any
	env.JAVA_HOME = tool 'JDK1.8.0.21'
	env.PATH = "${env.JAVA_HOME}/bin:${env.PATH}"

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
			}          
                         
                       }			  

}  
}	
