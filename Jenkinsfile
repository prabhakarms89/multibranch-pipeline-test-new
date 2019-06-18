pipeline{
     stages {
	stage('build'){
                  state {
                         echo "building successfull"
                         }
                       }   
         stage('test') {
                  state {
			echo "testing FibonacciSeries.java file"
			  sh 'javac FibonacciSeries.java'
			}          
                         
                       }			  

}  
}	
