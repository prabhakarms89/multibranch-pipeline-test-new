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
			echo "testing FibonacciSeries.java file"
			  sh 'javac ./FibonacciSeries.java'
			}          
                         
                       }			  

}  
}	
