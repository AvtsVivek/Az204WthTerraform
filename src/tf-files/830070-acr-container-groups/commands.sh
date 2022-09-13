
# cd into the directory.
cd ./src/tf-files/830070-acr-container-groups/

cd ../../..

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 

# You will get the following error.
# This is because the images are not yet uploaded.

# soft.ContainerRegistry/registries/vivekswkcontainergroupacr]
# ╷
# │ Error: creating Container Group (Subscription: "10868091-0196-44e3-a0b8-8dee05259147"
# │ Resource Group Name: "hr-dev-rg-vivrag-hzgafp"
# │ Container Group Name: "nginx-continst-acg"): performing ContainerGroupsCreateOrUpdate: containerinstance.ContainerInstanceClient#ContainerGroupsCreateOrUpdate: Failure 
# sending request: StatusCode=0 -- Original Error: Code="MultipleErrorsOccurred" Message="Multiple error occurred: 'BadRequest':'InaccessibleImage':'The image 'vivekswkcontainergroupacr.azurecr.io/simplewebappwithmysql:v1' in container group 'nginx-continst-acg' is not accessible. Please check the image and registry credential.';'BadRequest':'InaccessibleImage':'The image 'vivekswkcontainergroupacr.azurecr.io/mysqlwithdata:v1' in container group 'nginx-continst-acg' is not accessible. Please check the image and registry credential.'."
# │
# │   with azurerm_container_group.acg,
# │   on tf7-container-group.tf line 1, in resource "azurerm_container_group" "acg":
# │    1: resource "azurerm_container_group" "acg" {
# │
# ╵
# So we have to upload the images.
# Now, review the resources.
# Note the acr name. It should be vivekswkcontainergroupacr
# Now to upload the image, 
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

# Now get the password and update it in the following. Look into azurerm_container_group 

#```
#  image_registry_credential {
#    server   = "vivekswkcontainergroupacr.azurecr.io"
#    username = "vivekswkcontainergroupacr"
#    password = "PEboTM0WdCDznMMRMM/uVhi4Qgr2TrPd"
#  }
#```

# Now apply again. This time it should be successifull.

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 

# Now you can browse the ip address or FQDN

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
