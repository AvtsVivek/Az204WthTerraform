cd ../../..

# cd into the directory.
cd ./src/tf-files/601000-simple-web-app-to-linux-vm/

# First ensure the simple web app is published. 
# Run either of the following two comands

dotnet publish ./../../dotnet-apps/0020-simple-webapp/simple-webapp.csproj
dotnet publish ..\..\dotnet-apps\0020-simple-webapp\simple-webapp.csproj

#  -c Release
dotnet publish -c Release ./../../dotnet-apps/0020-simple-webapp/simple-webapp.csproj
dotnet publish -c Release ..\..\dotnet-apps\0020-simple-webapp\simple-webapp.csproj

# Once published, just verify and see.
dotnet ./../../dotnet-apps/0020-simple-webapp/bin/Release/net6.0/publish/simple-webapp.dll

# Now brwose to localhost:5000

# Run the following in bash prompt. In pwershell it will not work.
mkdir ssh-keys
cd ssh-keys

# Run the following in bash prompt. In pwershell it will not work.
# When asked for passphrase, just enter for empty password, dont give any password.

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
# Run the following in bash prompt, NOT PowerShell
# If you get the following permission denined, 
# azureuser@40.114.14.64: Permission denied (publickey,gssapi-keyex,gssapi-with-mic)
# then you are not in the correct directory.

cd ..

cd ./src/tf-files/601000-simple-web-app-to-linux-vm/

ssh -i ssh-keys/terraform-azure.pem azureuser@4.227.241.227

cd /var/log 

cat cloud-init-output.log

sudo -i

# Wait for at least 5 minutes. Then run the following commands.

sudo find / -type d -iname '.dotnet'

sudo find / -type d -iname 'dotnet'

sudo find / -iname 'dotnet-install.sh'

ps -ef | grep dotnet

sudo dotnet --list-runtimes

sudo dotnet --list-sdks

sudo dotnet --version

exit

# For a single file transfer
# The following demonistrates file transfer, single or entire folder. 
scp -i ssh-keys/terraform-azure.pem ./ReadMe.md azureuser@4.227.241.227:/home/azureuser

# For an entire directory
# scp -r -i ssh-keys/terraform-azure.pem ./images azureuser@20.124.10.138:/home/azureuser
# copy the publish directory.
# Ensure the app is built and published. The required commands are way above

scp -r -i ssh-keys/terraform-azure.pem ./../../dotnet-apps/0020-simple-webapp/bin/Release/net6.0/publish azureuser@20.163.228.80:/home/azureuser

ssh -i ssh-keys/terraform-azure.pem azureuser@4.227.241.227

# Finally to start the app. The following may not work.
sudo /root/.dotnet/dotnet ./publish/simple-webapp.dll


sudo dotnet ./publish/simple-webapp.dll

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

# look for port 5000
netstat -lntp

curl localhost:5000

curl localhost

## Thats it.

exit

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
