#!/bin/sh
#sudo yum update -y
# httpd is the web server, apachi server.
sudo yum install -y httpd

# The following command will enable the apache server, whenever the system is rebooted.
sudo systemctl enable httpd

# The following command will start the apache server, whenever the system is rebooted.
sudo systemctl start httpd  

# In these redhat vms, there is a default firewalld running, so we want to stop it.
sudo systemctl stop firewalld

# In these redhat vms, there is a default firewalld running, so we want to stop it and then disalbe it.
sudo systemctl disable firewalld

# Full permissions to /var
sudo chmod -R 777 /var/www/html 

# The host name will be made available in the index page by the following command.
sudo echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/index.html

sudo mkdir /var/www/html/app1

sudo echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/app1/hostname.html

# When we are using applictions gateway load balancer, when we are doing http prob, we can use the following status.html file.
sudo echo "Welcome to stacksimplify - WebVM App1 - App Status Page" > /var/www/html/app1/status.html

# Some fancy html stuff to make the index.html file look nice.
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - WebVM APP-1 </h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html

# Not clear why 169.254.169.254 is hardcoded. Not clear about this.
sudo curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" -o /var/www/html/app1/metadata.html