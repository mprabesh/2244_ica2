pipeline {
    agent any
    stages {
        stage('Cleanup') {
            steps {
                cleanWs()
            }
        }

        stage('Clone Git Repo') {
            steps {
                checkout scm
            }
        }

        stage('Listing files') {
            steps {
                sh 'ls -l'
            }
        }

        stage('Build and Push') {
            steps {
                echo 'Building..'
                dir('app'){
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                        sh '''
                            docker build -t magarp0723/2244_ica2:v1 .
                            docker login -u ${USERNAME} -p ${PASSWORD}
                            docker push magarp0723/2244_ica2:v1
                        '''
                    }
                }
            }
        }

        stage('Image push completed'){
            steps {
                echo 'Completed building and pushing image'
            }
        }

        // stage('Deploy container'){
        //     steps {
        //         echo "deploying container"
        //         sh 'docker stop todo-app || true && docker rm todo-app || true'
        //         sh 'docker run --name todo-app -d -p 3000:3000 msalim22/todo-list-app:v2'
        //     }
        // }

        // This block is to deploy the container into another application server.
        // You need sshAgent Jenkins plugin to be installed (from Managed Jenkins -> Plugin) and SSH communication is enabled between Jenkins and Application server
        // stage('Deploy container into App server') {
        //     steps {
        //         sshagent(['ssh-key']) {
        //             withCredentials([usernamePassword(credentialsId: 'DockerHubPwd', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
        //                 sh '''
        //                     ssh -tt root@<APP_HOST_VM_IP> -o StrictHostKeyChecking=no "docker pull msalim22/todo-list-app"
        //                     ssh -tt root@<APP_HOST_VM_IP> -o StrictHostKeyChecking=no "docker stop todolist-app || true && docker rm todolist-app || true"
        //                     ssh -tt root@<APP_HOST_VM_IP> -o StrictHostKeyChecking=no "docker run --name todolist-app -d -p 9000:3000 msalim22/todo-list-app"
        //                 '''
        //             }
        //         }
        //     }
        // }
    }
}