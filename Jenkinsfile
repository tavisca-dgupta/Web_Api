pipeline {
    agent any
    stages {
        stage('Restore') {
            steps{
                            echo 'Restoring packages'
                bat 'dotnet restore'
            }
        }
     	stage('Build'){
            steps{
                     		echo 'build project'
                bat 'dotnet build HelloHiApi.sln -p:Configuration=release -v:q'
            }

     	}
     	stage('Test'){
            steps{
                     		echo 'Test project'
                bat 'dotnet test HelloHiApi.Test/HelloHiApi.Test.csproj -p:Configuration=release -v:q'
                }

     	}
     	stage('Publish'){
            steps{
                     		echo 'publish project'
                bat 'dotnet publish'
            }

     	}

        stage('deploy') {

            steps {
                        bat 'docker build -t HelloHiApi -f dockerfile .'
                        bat 'docker run --rm -p 8004:8004/tcp HelloHiApi:latest'
            }
        }

     	
    }
}
