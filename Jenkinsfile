pipeline {
    agent any
    stages {
        stage('Restore') {
            steps{
                            echo 'Restoring packages'
                sh 'dotnet restore'
            }
        }
     	stage('Build'){
            steps{
                     		echo 'build project'
                sh 'dotnet build HelloHiApi.sln -p:Configuration=release -v:q'
            }

     	}
     	stage('Test'){
            steps{
                     		echo 'Test project'
                sh 'dotnet test HelloHiApi.Test/HelloHiApi.Test.csproj -p:Configuration=release -v:q'
                }

     	}
     	stage('Publish'){
            steps{
                     		echo 'publish project'
                sh 'dotnet publish'
            }

     	}

        stage('deploy') {

            steps {
                        sh 'docker build -t HelloHiApi -f dockerfile .'
                        sh 'docker run --rm -p 8004:8004/tcp HelloHiApi:latest'
            }
        }

     	
    }
}
