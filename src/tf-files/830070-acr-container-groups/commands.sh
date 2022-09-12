
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

# Now time to build the web app image. This web app needs a mysql database.

# cd into the directory.
# Note we are going into that directry which is not where the Dockerfile is present. 
# Its the context location, where .dockerignore file is present.
cd ./../../dotnet-apps/0150-ConnectToMySqlAppWithConString/

docker build -t vivekswkcontainergroupacr.azurecr.io/simplewebappwithmysql:v1 . -f ConnectToMySqlAppWithConString/Dockerfile

docker image ls

cd ./../../../src/tf-files/830070-acr-container-groups/

az acr login --name vivekswkcontainergroupacr

docker push vivekswkcontainergroupacr.azurecr.io/mysqlwithdata:v1

docker push vivekswkcontainergroupacr.azurecr.io/simplewebappwithmysql:v1


terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 

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
