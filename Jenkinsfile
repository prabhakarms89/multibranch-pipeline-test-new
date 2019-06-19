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
			 
			 sh 'javac -d . src/*.java'
			  
			}          
                         
                       }
	     stage('promote features-1 to master') {
	     
		     when {
			     branch 'features-1'
		     	  }
		     steps {
			     echo 'git checkout features-1'
		           }
		     
	     }

}  
}	
