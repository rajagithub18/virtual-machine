pipeline{
    agent{
        label "NODEJS-JDK-11"
    }
    stages{
        stage("create a vm"){
            steps{
                sh 'chmod 777 task.sh'
                sh './task.sh'
            }
            
        }
    }
    
}