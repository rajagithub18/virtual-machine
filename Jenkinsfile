pipeline{
    agent{
        label "NODEJS-JDK-11"
    }
    stages{
        stage("create a vm"){
            steps{
                sh './task.sh'
            }
            
        }
    }
    
}