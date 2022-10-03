cd ../../..

# cd into the directory.
cd ./src/tf-files/630100-simple-web-app-to-linux-vm-ngnx/

dotnet run --project ./../../dotnet-apps/0020-simple-webapp/simple-webapp.csproj
dotnet build ./../../dotnet-apps/0020-simple-webapp/simple-webapp.csproj

# First ensure the simple web app is published. 
# Run either of the following two comands
# Debug
dotnet publish ./../../dotnet-apps/0020-simple-webapp/simple-webapp.csproj
dotnet publish ..\..\dotnet-apps\0020-simple-webapp\simple-webapp.csproj

#  -c Release
dotnet publish -c Release ./../../dotnet-apps/0020-simple-webapp/simple-webapp.csproj
dotnet publish -c Release ..\..\dotnet-apps\0020-simple-webapp\simple-webapp.csproj

# Once published, just verify and see.
dotnet ./../../dotnet-apps/0020-simple-webapp/bin/Release/net6.0/publish/simple-webapp.dll

# Now brwose to localhost:5000

# Now for the console app.

dotnet run --project ./../../dotnet-apps/0010-simple-console-app/simple-console-app.csproj

# First ensure the simple web app is published. 
# Run either of the following two comands
# Debug
dotnet publish ./../../dotnet-apps/0010-simple-console-app/simple-console-app.csproj
dotnet publish ..\..\dotnet-apps\0010-simple-console-app\simple-console-app.csproj

#  -c Release
dotnet publish -c Release ./../../dotnet-apps/0010-simple-console-app/simple-console-app.csproj
dotnet publish -c Release ..\..\dotnet-apps\0010-simple-console-app\simple-console-app.csproj

# Once published, just verify and see.
dotnet ./../../dotnet-apps/0010-simple-console-app/bin/Release/net6.0/publish/simple-console-app.dll

# Now for Web api project.

dotnet run --project ./../../dotnet-apps/0030-simple-web-api/simple-web-api.csproj --urls "http://localhost:5100;https://localhost:5101"

# First ensure the simple web api is published.
# Run either of the following two comands
# Debug
dotnet publish ./../../dotnet-apps/0030-simple-web-api/simple-web-api.csproj
dotnet publish .\..\..\dotnet-apps\0030-simple-web-api\simple-web-api.csproj

#  -c Release
dotnet publish -c Release ./../../dotnet-apps/0030-simple-web-api/simple-web-api.csproj
dotnet publish -c Release .\..\..\dotnet-apps\0030-simple-web-api\simple-web-api.csproj

# Once published, just verify and see.
dotnet ./../../dotnet-apps/0030-simple-web-api/bin/Release/net6.0/publish/simple-web-api.dll --urls "http://localhost:5100;https://localhost:5101"
# dotnet ./../../dotnet-apps/0030-simple-web-api/bin/Release/net6.0/publish/simple-web-api.dll --urls "http://localhost:5100"

# Now brwose to localhost:6000/weatherforcaste

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

ssh -i ssh-keys/terraform-azure.pem azureuser@4.227.229.233

cd /var/log

cat cloud-init-output.log

sudo -i

# Wait for at least 5 minutes. Then run the following commands.

sudo find / -type d -iname 'dotnet'

# The following may not work
sudo find / -type d -iname '.dotnet'

# We are not using this file any more. 
sudo find / -iname 'dotnet-install.sh'

ps -ef | grep dotnet

sudo dotnet --list-runtimes

# The following two are not working.
dotnet --list-sdks
dotnet --version

ps -ef | grep dotnet

# The following works.
dotnet --info

exit

# proxy:error pid Permission denied: AH00957: HTTP: attempt to connect to 127.0.0.1:5000 (127.0.0.1) failed
# http://sysadminsjourney.com/content/2010/02/01/apache-modproxy-error-13permission-denied-error-rhel/

# The following two are not necessary as of now.
# scp -r -i ssh-keys/terraform-azure.pem azureuser@20.127.81.39:/etc/httpd/conf.d/ ./confbackup.d
# scp -r -i ssh-keys/terraform-azure.pem azureuser@20.127.81.39:/etc/httpd/conf/ ./confbackup

# For an entire directory
# scp -r -i ssh-keys/terraform-azure.pem ./images azureuser@20.124.10.138:/home/azureuser
# copy the publish directory.

# Run the following command in git bash terminal.

# First ensure you are in correct directory.
cd ./src/tf-files/630100-simple-web-app-to-linux-vm-ngnx/

scp -r -i ssh-keys/terraform-azure.pem ./../../dotnet-apps/0020-simple-webapp/bin/Release/net6.0/publish azureuser@4.227.229.233:/home/azureuser/simple-web-app

scp -r -i ssh-keys/terraform-azure.pem ./../../dotnet-apps/0010-simple-console-app/bin/Release/net6.0/publish azureuser@4.227.229.233:/home/azureuser/simple-console-app

scp -r -i ssh-keys/terraform-azure.pem ./../../dotnet-apps/0030-simple-web-api/bin/Release/net6.0/publish azureuser@4.227.229.233:/home/azureuser/simple-web-api

sudo find / -iname 'simple-webapp.dll'

sudo find / -iname 'simple-console-app.dll'

sudo find / -iname 'simple-web-api.dll'

dotnet /home/azureuser/simple-console-app/simple-console-app.dll

# Start the app and check
dotnet /home/azureuser/simple-web-app/simple-webapp.dll

# Api
dotnet /home/azureuser/simple-web-api/simple-web-api.dll --urls "http://localhost:5100"

# First take a backup of the conf file.
# cd /etc/nginx/nginx.conf

mkdir nginxconfbackup

scp -i ssh-keys/terraform-azure.pem azureuser@4.227.229.233:/etc/nginx/nginx.conf nginxconfbackup/

# Now copy the nginx.conf file.

scp -i ssh-keys/terraform-azure.pem ./nginxconf/nginx-default.conf azureuser@4.227.229.233:/etc/nginx/nginx.conf 

scp -i ssh-keys/terraform-azure.pem ./nginxconf/dotnetapp.conf azureuser@4.227.229.233:/etc/nginx/sites-enabled/

sudo systemctl stop nginx

sudo systemctl start nginx

sudo systemctl status nginx

sudo systemctl status nginx.service

sudo journalctl -xe

sudo systemctl restart nginx

scp -r -i ssh-keys/terraform-azure.pem ./linux-service-files/* azureuser@4.227.229.233:/usr/tmp/

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

# Now the dotnet web api.
sudo systemctl enable kestrel-api.service

sudo systemctl restart kestrel-api.service

sudo systemctl status kestrel-api.service

ps -ef | grep dotnet

# look for port 5000 and 5100
netstat -lntp

curl localhost:5000

curl localhost:5100/weatherforecast

sudo systemctl restart nginx

sudo systemctl status nginx

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

Now browse the vm. 


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
