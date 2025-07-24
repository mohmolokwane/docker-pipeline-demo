Docker-Pipeline-Demo: CI/CD to AWS EKS

# Requirements
- Python 3.12+
- Docker
- Helm
- kubectl
- AWS CLI
- Sonarqube

#AWS Setup
- An EKS cluster named `Production` in region `us-east-1`
- IAM user with permissions to:
  - Push to ECR
  - Access EKS
- An ECR repository named `docker-pipeline-demo`
- Secrets configured in GitHub:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `SONAR_TOKEN`


#Project Structure

#CI/CD Workflow Steps

#1.Lint and Test
- Install dependencies from `app/requirements.txt`
- Run flake8 linter and output results
- Run Pytest with coverage reporting

#2.SonarCloud Analysis
- Scan source code for bugs, code smells, and coverage
- Requires valid `SONAR_TOKEN` and access to SonarCloud

#3.Docker Build & Push
- Log in to AWS ECR using OpenID Connect
- Build Docker image tagged as `latest`
- Push image to ECR repository

#4.Deploy to EKS
- Update kubeconfig to target `Production` cluster
- Install Helm chart with:
  - Image pulled from ECR
  - Custom namespace: `docker-pipeline-demo`
  - Dynamic release name: `Dock`
  - Image tag override from pipeline
#5 Access Tokens
   -AWS_ACCESS_KEY_ID
   -AWS_SECRET_ACCESS_KEY
   -DOCKER_PASSWORD
   -DOCKER_USERNAME
   -KUBECONFIG_DATA
   -SONAR_TOKEN

### To Get Started

#1.create a repo in github, ,make sure the above are configured.
#2.Open Git Bash.
#3.Navigate to the root directory of your project.
#4.Initialize the local directory as a Git repository. By default, the initial branch is called main.
  $ git init -b main
#5.Add the files in your new local repository. This stages them for the first commit.
   $ git add .
#6.Commit the files that you've staged in your local repository.
  $ git commit -m "First commit"
#7 The workflow is configured to tricker on every push so It will start the build and deploy.

#8 you can also Deploy Helm manually, make sure you have aws cli Installed, from bash run
  $ kubectx    #to check the cluster you are connected to 
  $ helm install <release name> <./chart directory>  $to Install using helm packages 
  $ kubectl get po #to check if the image is runing
  $ kubectl get deployment #to check deployment 
  $ kubectl get all to check everything 
  $ kubectl get ingress    #check the external IP or domain name from the Ingress resource:
  9# got to your browser and type it 
