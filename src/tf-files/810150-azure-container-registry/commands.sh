cd ../../..

# cd into the directory.
cd ./src/tf-files/810150-azure-container-registry/

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 

terraform state list

# Once successifully provisioned, the next step is to build an image so we can push it.

docker run --name mynginxdefault -p 81:80 -d nginx

docker container ls -a

# Now browse to localhost:81

docker container stop mynginxdefault

docker container ls

docker container ls -a

docker container rm mynginxdefault

docker container ls -a

dir

docker build -t avts/nginxvivek:v1 .

docker run --name viveknginx -p 81:80 -d avts/nginxvivek:v1

# Now browse to localhost:81

docker container stop viveknginx

docker container ls

docker container ls -a

docker container rm viveknginx

docker container ls -a

terraform state show 

terraform show terraform.tfstate

terraform plan -destroy -out main.destroy.tfplan

docker pull mcr.microsoft.com/hello-world

# Go to the azure portal, then acr and then get the login server.

docker tag mcr.microsoft.com/hello-world <login-server>/hello-world:v1

# terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan

Remove-Item -Recurse -Force .terraform/modules

Remove-Item -Recurse -Force .terraform

Remove-Item terraform.tfstate

Remove-Item terraform.tfstate.backup

Remove-Item main.tfplan

Remove-Item main.destroy.tfplan

Remove-Item .terraform.lock.hcl
