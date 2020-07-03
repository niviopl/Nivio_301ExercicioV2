pipeline{
    agent any
      parameters{
         string(
           name: "VM_USERNAME", defaultValue:"ubuntu")
      }
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
             script{
               def targetPath = sh(
                 script:"find target/ -name Api-Investimentos-*.jar",
                 returnStdout:true
               ).trim()
             }
             sh "scp -o StrictHostKeyChecking=no target/Api-Investimentos-0.0.1-SNAPSHOT.jar ${params.VM_USERNAME}@18.223.1.124:/home/ubuntu/"
             echo "${targetPath} Copiado para VM"
          }
        }
        stage('Atualizar o Serviço'){
          when{branch 'master'}
          steps{
             /* sh 'ssh -o StrictHostKeyChecking=no -t ubuntu@18.223.1.124 sudo systemctl reload api-invest.service' */
             echo 'Serviço atualizado'
          }
        }
     }
}




























     
