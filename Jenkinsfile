pipeline {
    agent any

    parameters {
        string(defaultValue: "HelloHiApi.sln", description: 'Solution file name', name: 'solutionName')
        string(defaultValue: "HelloHiApi.Test/HelloHiApi.Test.csproj", description: 'Test file name', name: 'testName')
    }
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
                bat 'dotnet build %solutionName% -p:Configuration=release -v:q'
            }

     	}
     	stage('Test'){
            steps{

                echo 'Test project'
                bat 'dotnet test  %testName% -p:Configuration=release -v:q'

                }

     	}
     	stage('Publish'){
            steps{
                echo 'publish project'
                bat 'dotnet publish %solutionName% -c RELEASE -o Publish'

            }

     	}

        stage('deploy') {
            steps {
                        echo 'run docker'
                        bat 'docker build -t HelloHiApi -f dockerfile .'
                        bat 'docker run --rm -p 4000:11180/tcp HelloHiApi'

            }
        }

     	
    }
}
