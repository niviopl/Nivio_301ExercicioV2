pipeline{
    agent any
      post{
        success{
           echo 'Sucesso'
        }
        failure{
           echo 'Falha'
        }
        always{
           echo 'iniciado'
        }
     }
     stages{
	stage('Executar Testes'){
          steps{
             ./mvnw test
             echo 'teste executado'
          }
        }
	stage('Criar o JAR'){
          steps{
             ./mvnw clean package 
             echo 'JAR criado'
          }
        }
        stage('Copiar o JAR na VM'){
          steps{
             scp -i Nivio.pem Api-Investimentos-0.0.1-SNAPSHOT.jar ubuntu@18.223.1.124:Api-Investimentos-0.0.1-SNAPSHOT.jar  
          }
        }      
     }
}




























     
