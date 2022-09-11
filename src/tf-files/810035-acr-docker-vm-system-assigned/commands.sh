
# cd into the directory.
cd ./src/tf-files/810050-acr-docker-vm-user-assigned/

cd ../../..

cd ssh-keys

# Run the following in bash prompt. In pwershell it will not work.
ssh-keygen \
    -m PEM \
    -t rsa \
    -b 4096 \
    -C "azureuser@myserver" \
    -f terraform-azure.pem 


Get-ChildItem . 

Get-ChildItem ./ssh-keys

cd ssh-keys

Rename-Item ./terraform-azure.pem.pub ./terraform-azure.pub

cd ..

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 

# Once successfully applied, Review the resources.
# Download the topology diagram. Go to the created vnet and then diagram.
# Also look at subnets and corresponding security groups.

# Connect to the VM. Ensure the vm is running.
# Note the IP address.
# Run the following with the ip address.
# Run the following in bash prompt.
# If you get the following permission denined, 
# azureuser@40.114.14.64: Permission denied (publickey,gssapi-keyex,gssapi-with-mic)
# then you are not in the correct directory.



########################################################################

docker container ls -a

# Verify in the acr on portal, there should be two images

# 3. 

# cd into the directory.
cd ./../../dotnet-apps/0020-simple-webapp

docker build -t simplewebapp:v1 .

docker run --name viveksimplewebapp -p 81:80 -d simplewebapp:v1

# Now browse to localhost:81 to test and see. If you feel there is caching, then try refreshing again and again.

docker container stop viveksimplewebapp

docker container ls

docker container ls -a

docker container rm viveksimplewebapp

docker tag simplewebapp:v1 acruukazh.azurecr.io/simplewebapp:v1

az acr login --name acruukazh

# docker push <login-server>/hello-world:v1

docker push acruukazh.azurecr.io/simplewebapp:v1

# Now remove the local image

docker rmi simplewebapp:v1 acruukazh.azurecr.io/simplewebapp:v1

# OR

docker image rm simplewebapp:v1 acruukazh.azurecr.io/simplewebapp:v1

docker image ls

docker pull acruukazh.azurecr.io/simplewebapp:v1

docker image ls

docker run --name viveksimpledotnetapp -p 81:80 -d acruukazh.azurecr.io/simplewebapp:v1

docker run --name viveksimpledotnetapp -p 80:80 -d acruukazh.azurecr.io/simplewebapp:v1

# Now browse to localhost:81

docker container stop viveksimpledotnetapp

docker container ls

docker container ls -a

docker container rm viveksimpledotnetapp

docker container ls -a

# Verify in the acr on portal, there should be one images


########################################################################

cd ./../../tf-files/810050-acr-docker-vm-user-assigned/

# or the following as needed

cd ./src/tf-files/810050-acr-docker-vm-user-assigned/

cd ..

# cd into the directory.

ssh -i ssh-keys/terraform-azure.pem azureuser@20.232.45.219

sudo docker pull acruukazh.azurecr.io/simplewebapp:v1

cd /var/log

cat cloud-init-output.log

sudo -i

# Wait for at least 5 minutes. Then run the following commands.

exit

# Now that you are in the VM, you can run the following commands.

hostname

# Switch to the root user.
sudo su -

cd /var/log

# Now look for cloud-init-output.log file.

# use the tail command to see the last 100 lines.
tail -100f cloud-init-output.log
# Review what all happened as the vm was booting.

sudo docker pull acruukazh.azurecr.io/simplewebapp:v1

sudo az login --identity --username /subscriptions/10868091-0196-44e3-a0b8-8dee05259147/resourcegroups/hr-dev-rg-vivrag-uukazh/providers/Microsoft.ManagedIdentity/userAssignedIdentities/hr-dev-appgw-umid

az acr login --name acruukazh # Will give errro

sudo docker container ls -a

sudo docker container rm appnginx1 

sudo docker run --name viveksimpledotnetapp -p 82:80 -d acruukazh.azurecr.io/simplewebapp:v1

# Now note the ip address of the VM created and then browse to the following 

# http://20.232.45.219:82/

# http://20.232.45.219:80/

# Thats it.

exit

terraform state list

# To create diagram, run the following command.
code . -r 
# Ensure Azure Terraform extension is installed in VS Code
# Press F1 and Run the command AzureTerraform: Visualize. Graph.png will be generated.

# For the following command to work, you need to pass on the resource, or data source.
# This resource or data source is got from terraform state list command

terraform state show 

terraform show terraform.tfstate

terraform plan -destroy -out main.destroy.tfplan

# terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan
