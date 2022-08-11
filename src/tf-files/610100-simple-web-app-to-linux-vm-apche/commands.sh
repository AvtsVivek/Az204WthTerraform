
# cd into the directory.
cd ./src/tf-files/610100-simple-web-app-to-linux-vm-apche/


cd ../../..

dotnet run --project ./../../dotnet-apps/simple-webapp/simple-webapp.csproj

# First ensure the simple web app is published. 
# Run either of the following two comands
# Debug
dotnet publish ./../../dotnet-apps/simple-webapp/simple-webapp.csproj
dotnet publish ..\..\dotnet-apps\simple-webapp\simple-webapp.csproj

#  -c Release
dotnet publish -c Release ./../../dotnet-apps/simple-webapp/simple-webapp.csproj
dotnet publish -c Release ..\..\dotnet-apps\simple-webapp\simple-webapp.csproj

# Once published, just verify and see.
dotnet ./../../dotnet-apps/simple-webapp/bin/Release/net6.0/publish/simple-webapp.dll

# Now brwose to localhost:5000


# Now for the console app.

dotnet run --project ./../../dotnet-apps/simple-console-app/simple-console-app.csproj

# First ensure the simple web app is published. 
# Run either of the following two comands
# Debug
dotnet publish ./../../dotnet-apps/simple-console-app/simple-console-app.csproj
dotnet publish ..\..\dotnet-apps\simple-console-app\simple-console-app.csproj

#  -c Release
dotnet publish -c Release ./../../dotnet-apps/simple-console-app/simple-console-app.csproj
dotnet publish -c Release ..\..\dotnet-apps\simple-console-app\simple-console-app.csproj

# Once published, just verify and see.
dotnet ./../../dotnet-apps/simple-console-app/bin/Release/net6.0/publish/simple-console-app.dll

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

terraform show main.tfplan

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
cd ./src/tf-files/610100-simple-web-app-to-linux-vm-apche/

ssh -i ssh-keys/terraform-azure.pem azureuser@40.71.250.187

sudo -i

# Wait for at least 5 minutes. Then run the following commands.

sudo find / -type d -iname '.dotnet'

sudo find / -type d -iname 'dotnet'

sudo find / -iname 'dotnet-install.sh'

ps -ef | grep dotnet

exit

# proxy:error pid Permission denied: AH00957: HTTP: attempt to connect to 127.0.0.1:5000 (127.0.0.1) failed
# http://sysadminsjourney.com/content/2010/02/01/apache-modproxy-error-13permission-denied-error-rhel/

# The following two are not necessary as of now.
# scp -r -i ssh-keys/terraform-azure.pem azureuser@20.127.81.39:/etc/httpd/conf.d/ ./confbackup.d
# scp -r -i ssh-keys/terraform-azure.pem azureuser@20.127.81.39:/etc/httpd/conf/ ./confbackup

# For an entire directory
# scp -r -i ssh-keys/terraform-azure.pem ./images azureuser@20.124.10.138:/home/azureuser
# copy the publish directory.
scp -r -i ssh-keys/terraform-azure.pem ./../../dotnet-apps/simple-webapp/bin/Release/net6.0/publish azureuser@40.71.250.187:/home/azureuser/simple-web-app

scp -r -i ssh-keys/terraform-azure.pem ./../../dotnet-apps/simple-console-app/bin/Release/net6.0/publish azureuser@40.71.250.187:/home/azureuser/simple-console-app

sudo find / -iname 'simple-webapp.dll'

sudo find / -iname 'simple-console-app.dll'

/usr/dotnet/dotnet /home/azureuser/simple-console-app/simple-console-app.dll

# Finally to start the app
/usr/dotnet/dotnet /home/azureuser/simple-web-app/simple-webapp.dll

# For a single file transfer
scp -i ssh-keys/terraform-azure.pem ./conf/httpd.conf azureuser@40.71.250.187:/etc/httpd/conf/

sudo systemctl restart httpd

scp -r -i ssh-keys/terraform-azure.pem ./linux-service-files/* azureuser@40.71.250.187:/usr/tmp/

sudo cp -r -f /usr/tmp/*.service /etc/systemd/system/

sudo systemctl daemon-reload

# First the console app
sudo systemctl enable console-app.service

sudo systemctl restart console-app.service

sudo systemctl status console-app.service

# Now the dotnet app.
sudo systemctl enable kestrel-dotNetapp.service

sudo systemctl restart kestrel-dotNetapp.service

sudo systemctl status kestrel-dotNetapp.service

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

# look for port 5000
netstat -lntp

curl localhost:5000

## Thats it.
cd /var/www/html

cd ./app1

ls -lrta

Now browse the vm. 

# use ip address or dns name.

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

terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan
