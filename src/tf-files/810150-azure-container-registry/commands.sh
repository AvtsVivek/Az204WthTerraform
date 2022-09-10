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

# 1. First get a hello world image

docker container ls -a

docker pull mcr.microsoft.com/hello-world

# Go to the azure portal, then acr and then get the login server.

az acr login --name acrvglbmi

# Ensure you get login succeeded.

# docker tag mcr.microsoft.com/hello-world <login-server>/hello-world:v1

docker tag mcr.microsoft.com/hello-world acrvglbmi.azurecr.io/hello-world:v1

# docker push <login-server>/hello-world:v1

docker push acrvglbmi.azurecr.io/hello-world:v1

# Now, check in the portal, the remove the local image

docker rmi mcr.microsoft.com/hello-world acrvglbmi.azurecr.io/hello-world:v1

# OR

docker image rm mcr.microsoft.com/hello-world acrvglbmi.azurecr.io/hello-world:v1

docker image ls

docker pull acrvglbmi.azurecr.io/hello-world:v1

docker image ls

# 2. First build a local image

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

# Now browse to localhost:81 to test and see

docker container stop viveknginx

docker container ls

docker container ls -a

docker container rm viveknginx

docker tag avts/nginxvivek:v1 acrvglbmi.azurecr.io/nginxvivek:v1

# docker push <login-server>/hello-world:v1

docker push acrvglbmi.azurecr.io/nginxvivek:v1

# Now remove the local image

docker rmi avts/nginxvivek:v1 acrvglbmi.azurecr.io/nginxvivek:v1

# OR

docker image rm avts/nginxvivek:v1 acrvglbmi.azurecr.io/nginxvivek:v1

docker image ls

docker pull acrvglbmi.azurecr.io/nginxvivek:v1

docker image ls

docker run acrvglbmi.azurecr.io/nginxvivek:v1

docker run --name viveknginx -p 81:80 -d acrvglbmi.azurecr.io/nginxvivek:v1

# Now browse to localhost:81

docker container stop viveknginx

docker container ls

docker container ls -a

docker container rm viveknginx

docker container ls -a

# Verify in the acr on portal, there should be two images

# 3. 

\dotnet-apps\0020-simple-webapp\Dockerfile

# cd into the directory.
cd ./../../dotnet-apps/0020-simple-webapp

docker build -t simplewebapp:v1 .

docker run --name viveksimplewebapp -p 81:80 -d simplewebapp:v1

# Now browse to localhost:81 to test and see. If you feel there is caching, then try refreshing again and again.

docker container stop viveksimplewebapp

docker container ls

docker container ls -a

docker container rm viveksimplewebapp

docker tag simplewebapp:v1 acrvglbmi.azurecr.io/simplewebapp:v1

# docker push <login-server>/hello-world:v1

docker push acrvglbmi.azurecr.io/simplewebapp:v1

# Now remove the local image

docker rmi simplewebapp:v1 acrvglbmi.azurecr.io/simplewebapp:v1

# OR

docker image rm simplewebapp:v1 acrvglbmi.azurecr.io/simplewebapp:v1

docker image ls

docker pull acrvglbmi.azurecr.io/simplewebapp:v1

docker image ls

docker run --name viveksimpledotnetapp -p 81:80 -d acrvglbmi.azurecr.io/simplewebapp:v1

# Now browse to localhost:81

docker container stop viveksimpledotnetapp

docker container ls

docker container ls -a

docker container rm viveksimpledotnetapp

docker container ls -a

# Verify in the acr on portal, there should be three images

#######################################################################################

cd ./../../tf-files/810150-azure-container-registry

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
