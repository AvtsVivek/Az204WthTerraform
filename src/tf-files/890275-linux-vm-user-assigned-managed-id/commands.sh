cd ../../..

# cd into the directory.
cd ./src/tf-files/890275-linux-vm-user-assigned-managed-id/

# Preparing the dotnet apps.

# First app
dotnet build ./../../dotnet-apps/0300-ManagedIdVmToStorageAcc/ManagedIdVmToStorageAcc.csproj

# First ensure the simple web app is published. 
# Run either of the following two comands
# Debug
dotnet publish ./../../dotnet-apps/0300-ManagedIdVmToStorageAcc/ManagedIdVmToStorageAcc.csproj
dotnet publish ..\..\dotnet-apps\0300-ManagedIdVmToStorageAcc\ManagedIdVmToStorageAcc.csproj

#  -c Release
dotnet publish -c Release ./../../dotnet-apps/0300-ManagedIdVmToStorageAcc/ManagedIdVmToStorageAcc.csproj
dotnet publish -c Release ..\..\dotnet-apps\0300-ManagedIdVmToStorageAcc\ManagedIdVmToStorageAcc.csproj

# Second app \0325-ManagedIdGetAccessToken\Program.cs
dotnet build ./../../dotnet-apps/0325-ManagedIdGetAccessToken/ManagedIdGetAccessToken.csproj

# First ensure the simple web app is published. 
# Run either of the following two comands
# Debug
dotnet publish ./../../dotnet-apps/0325-ManagedIdGetAccessToken/ManagedIdGetAccessToken.csproj
dotnet publish ..\..\dotnet-apps\0325-ManagedIdGetAccessToken\ManagedIdGetAccessToken.csproj

#  -c Release
dotnet publish -c Release ./../../dotnet-apps/0325-ManagedIdGetAccessToken/ManagedIdGetAccessToken.csproj
dotnet publish -c Release ..\..\dotnet-apps\0325-ManagedIdGetAccessToken\ManagedIdGetAccessToken.csproj

# If there are no errors, then the apps are ready.

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

# Get the blob url from the storage account. It should look somehting like this. See the images.

# var blobURI = "https://staticwebsitepdismj.blob.core.windows.net/content/index.html";
# https://staticwebsitevhmizx.blob.core.windows.net/content/index.html

# Then update in the file.
# ./../../dotnet-apps/0300-ManagedIdVmToStorageAcc/Program.cs

# Now build, ensure no errors and publish. 

# First App
dotnet build ./../../dotnet-apps/0300-ManagedIdVmToStorageAcc/ManagedIdVmToStorageAcc.csproj

# First ensure the simple web app is published. 
# Run either of the following two comands
# Debug
dotnet publish ./../../dotnet-apps/0300-ManagedIdVmToStorageAcc/ManagedIdVmToStorageAcc.csproj
dotnet publish ..\..\dotnet-apps\0300-ManagedIdVmToStorageAcc\ManagedIdVmToStorageAcc.csproj

#  -c Release
dotnet publish -c Release ./../../dotnet-apps/0300-ManagedIdVmToStorageAcc/ManagedIdVmToStorageAcc.csproj
dotnet publish -c Release ..\..\dotnet-apps\0300-ManagedIdVmToStorageAcc\ManagedIdVmToStorageAcc.csproj


# Second app \0325-ManagedIdGetAccessToken\Program.cs
dotnet build ./../../dotnet-apps/0325-ManagedIdGetAccessToken/ManagedIdGetAccessToken.csproj

# First ensure the simple web app is published. 
# Run either of the following two comands
# Debug
dotnet publish ./../../dotnet-apps/0325-ManagedIdGetAccessToken/ManagedIdGetAccessToken.csproj
dotnet publish ..\..\dotnet-apps\0325-ManagedIdGetAccessToken\ManagedIdGetAccessToken.csproj

#  -c Release
dotnet publish -c Release ./../../dotnet-apps/0325-ManagedIdGetAccessToken/ManagedIdGetAccessToken.csproj
dotnet publish -c Release ..\..\dotnet-apps\0325-ManagedIdGetAccessToken\ManagedIdGetAccessToken.csproj

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
cd ./src/tf-files/890275-linux-vm-user-assigned-managed-id/

ssh -i ssh-keys/terraform-azure.pem azureuser@20.163.234.237

cd /var/log

cat cloud-init-output.log

sudo -i

# Wait for at least 5 minutes. Then run the following commands.

sudo find / -type d -iname 'dotnet'

# The following may not work
sudo find / -type d -iname '.dotnet'

ps -ef | grep dotnet

# The following two are not working.
sudo dotnet --list-sdks
sudo dotnet --version

ps -ef | grep dotnet

# The following works.
dotnet --info


# Switch to the root user.
sudo su -

cd /var/log

# Now look for cloud-init-output.log file.

# use the tail command to see the last 100 lines.
tail -100f cloud-init-output.log
# Review what all happened as the vm was booting.

ls -lrta

# Press Ctrl+C to comeout.

ps -ef | grep dotnet

cd ./src/tf-files/890275-linux-vm-user-assigned-managed-id/

# Just to check before uploading.
sudo find / -iname 'ManagedIdVmToStorageAcc.dll'
sudo find / -iname 'ManagedIdGetAccessToken.dll'

# Upload the published folder on to the server.
# First App
scp -r -i ssh-keys/terraform-azure.pem ./../../dotnet-apps/0300-ManagedIdVmToStorageAcc/bin/Release/net6.0/publish azureuser@20.163.234.237:/home/azureuser/ManagedIdVmToStorageAcc

# Second App
scp -r -i ssh-keys/terraform-azure.pem ./../../dotnet-apps/0325-ManagedIdGetAccessToken/bin/Release/net6.0/publish azureuser@20.163.234.237:/home/azureuser/ManagedIdGetAccessToken

# Ensure that it has got uploaded successifully.
sudo find / -iname 'ManagedIdVmToStorageAcc.dll'
# Now from within the vm(using ssh), run the app
dotnet /home/azureuser/ManagedIdVmToStorageAcc/ManagedIdVmToStorageAcc.dll

sudo find / -iname 'ManagedIdGetAccessToken.dll'

dotnet /home/azureuser/ManagedIdGetAccessToken/ManagedIdGetAccessToken.dll

# You should see "The blob is downloaded"

# Ensure its indeed download.
sudo find / -iname 'downloaded_file_index.html'

ls -lrta


## Thats it.

## Thats it.

ls -lrta

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
