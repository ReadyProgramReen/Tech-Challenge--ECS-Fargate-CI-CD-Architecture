pipeline {
    agent any

    environment {
        AWS_REGION      = 'us-east-1'
        AWS_ACCOUNT_ID  = '517169952856'
        ECR_FRONTEND    = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/tech-challenge-1/frontend"
        ECR_BACKEND     = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/tech-challenge-1/backend"
        ECS_CLUSTER     = 'tech-challenge-1-cluster'
        FRONTEND_SERVICE = 'tech-challenge-1-frontend-service'
        BACKEND_SERVICE  = 'tech-challenge-1-backend-service'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('ECR Login') {
            steps {
                sh """
                    aws ecr get-login-password --region ${AWS_REGION} | \
                    docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
                """
            }
        }

        stage('Build & Push Backend') {
            steps {
                sh """
                    docker build -t ${ECR_BACKEND}:latest ./backend
                    docker push ${ECR_BACKEND}:latest
                """
            }
        }

        stage('Build & Push Frontend') {
            steps {
                sh """
                    docker build -t ${ECR_FRONTEND}:latest ./frontend
                    docker push ${ECR_FRONTEND}:latest
                """
            }
        }

        stage('Deploy to ECS') {
            steps {
                sh """
                    aws ecs update-service --cluster ${ECS_CLUSTER} --service ${FRONTEND_SERVICE} --force-new-deployment --region ${AWS_REGION}
                    aws ecs update-service --cluster ${ECS_CLUSTER} --service ${BACKEND_SERVICE} --force-new-deployment --region ${AWS_REGION}
                """
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully! ECS services updated with new images.'
        }
        failure {
            echo 'Pipeline failed. Check the logs above for details.'
        }
    }
}