pipeline{
    agent any
      parameters{
         string(
           name: "VM_USERNAME", defaultValue:"ubuntu")
      }
      post{
        success{
           echo "Sucesso!"
        }
        failure{
           echo "Falha!"
        }
        always{
           echo "Iniciado!"
        }
     }

     stages{

	    stage("Executar Testes"){
          steps{
            script{
  /*              docker.image("mysql:latest").withRun("-e 'MYSQL_ROOT_PASSWORD=12345678' -p Port_Var:3306"){ c ->
                    sh "while ! mysqladmin ping -h0.0.0.0 -P Port_Var --silent; do sleep 1; done"    */
                    sh  "./mvnw test"
                }
            /* } */
             echo "teste executado"
          }
        }

	    stage("Criar o JAR"){
          steps{
             sh "./mvnw package -DskipTests"
             echo "JAR criado"
          }
        }

        stage("01 Docker - Push"){
            steps{
                script{
                    docker.withRegistry("https://registry-itau.mastertech.com.br","registry_credential")
                    {
                        def customImage = docker.build("nivio-invest:${env.BUILD_ID}")
                        customImage.push()
                        customImage.push("latest")
                    }
                }
                echo "Feito Push no Registry"
            }
        }

        stage("02 Docker - Pull"){
            steps{
                script{
                    sh "ssh -o StrictHostKeyChecking=no -t ubuntu@18.223.1.124 'sudo docker pull registry-itau.mastertech.com.br/nivio-invest:latest'"
                    echo "Serviço atualizado"
                }
                echo "Feito Pull na VM"
            }
        }

     }
}
/*
*/



/*
        stage("Copiar o JAR na VM"){
          steps{
             script{
               def targetPath = sh(
                 script:"find target/ -name Api-Investimentos-*.jar",
                 returnStdout:true
                 ).trim()
                 sh "scp -o StrictHostKeyChecking=no ${targetPath} ${params.VM_USERNAME}@18.223.1.124:/home/ubuntu/"
                 echo "Arquivo ${targetPath} Copiado para VM - Echo dentro do script"
             }
             echo "Echo fora do script"
          }
        }
        stage("Atualizar o Serviço"){
          when{branch "master"}
          steps{
             sh "ssh -o StrictHostKeyChecking=no -t ubuntu@18.223.1.124 sudo systemctl start api-invest.service"
             echo "Serviço atualizado"
          }
        }


        def port = sh (
            script: "awk -v min=64000 -v max=65000 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'",
            returnStdout: true
        ).trim()
*/
























     
