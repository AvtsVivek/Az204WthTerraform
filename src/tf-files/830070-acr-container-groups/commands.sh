
# cd into the directory.
cd ./src/tf-files/830070-acr-container-groups/

cd ../../..

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 

# Once successfully applied, Review the resources.
# Note the acr name. It should be vivekswkcontainergroupacr
# First create a mysql docker image with data. 

cd create-docker-image

docker build -t vivekswkcontainergroupacr.azurecr.io/mysqlwithdata:v1 .

docker image ls

cd ..

# cd into the directory.
cd ./../../dotnet-apps/0020-simple-webapp

docker build -t simplewebapp:v1 .

# docker tag avts/nginxvivek:v1 acrvglbmi.azurecr.io/nginxvivek:v1

# docker push <login-server>/hello-world:v1

docker push acrvglbmi.azurecr.io/nginxvivek:v1

cd ..


terraform state show 

terraform show terraform.tfstate

terraform plan -destroy -out main.destroy.tfplan

# terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan


Remove-Item -Recurse -Force .terraform/modules

Remove-Item -Recurse -Force .terraform

Remove-Item terraform.tfstate

Remove-Item terraform.tfstate.backup

Remove-Item main.tfplan

Remove-Item main.destroy.tfplan

Remove-Item .terraform.lock.hcl
