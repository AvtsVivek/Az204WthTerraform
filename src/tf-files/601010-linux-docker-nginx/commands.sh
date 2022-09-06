
# cd into the directory.
cd ./src/tf-files/601010-linux-docker-nginx/

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

cd ..

# cd into the directory.
cd ./src/tf-files/630100-simple-web-app-to-linux-vm-ngnx/

ssh -i ssh-keys/terraform-azure.pem azureuser@20.25.73.78

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

ls -lrta

# Press Ctrl+C to comeout.

# check if the web server is running.
ps -ef | grep dotnet

ps -ef | grep nginx

yum list installed nginx

cd /etc/nginx

ls -lrta

# look for port 5000
netstat -lntp

curl localhost:5000

## Thats it.

# Press Ctrl+C to comeout.

# check if the web server is running.

# look for port 5000
netstat -lntp

curl localhost:5000

curl localhost

# Now browse the ip.
# Currently only / is working. /api is not working. 
# proxy_pass can be anything. http://localhost:5000 or http://localhost:5100
# If you use http://localhost:5100, then open the browse and check with http://20.119.71.75/weatherforecast(20.119.71.75 is the public ip of the linux vm)
#

## Thats it.

cd /var/www/html

cd ./app1

ls -lrta

# Now browse the vm. 
# You should see the nginx welcome page.
# Welcome to nginx!

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
