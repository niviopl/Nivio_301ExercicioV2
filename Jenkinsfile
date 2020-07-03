pipeline{
    agent any
      post{
        success{
           echo 'Sucesso!'
        }
        failure{
           echo 'Falha!'
        }
        always{
           echo 'Iniciado!'
        }
     }
     stages{
	    stage('Executar Testes'){
          steps{
             sh  './mvnw test'
             echo 'teste executado'
          }
        }
	    stage('Criar o JAR'){
          steps{
             sh './mvnw clean package'
             echo 'JAR criado'
          }
        }
        stage('Copiar o JAR na VM'){
          steps{
             sh 'scp -o StrictHostKeyChecking=no target/Api-Investimentos-0.0.1-SNAPSHOT.jar ubuntu@18.223.1.124:/home/ubuntu/'
             echo 'JAR Copiado para VM'
          }
        }
        stage('Atualizar o Serviço'){
          steps{
             sh 'ssh -o StrictHostKeyChecking=no -t ubuntu@HOST  sudo systemctl reload api-invest.service'
             echo 'Serviço atualizado'
          }
        }
     }
}




























     
