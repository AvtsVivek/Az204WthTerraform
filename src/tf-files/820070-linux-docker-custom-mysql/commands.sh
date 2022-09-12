cd ../../..

# cd into the directory.
cd ./src/tf-files/820070-linux-docker-custom-mysql/

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
cd ./src/tf-files/820070-linux-docker-custom-mysql/

ssh -i ssh-keys/terraform-azure.pem azureuser@20.163.187.121

cd /var/log

cat cloud-init-output.log

cd /tmp

tail -200f executionlogs.txt

# Wait for at least 5 minutes. Then run the following commands.

sudo docker container ls -a

sudo docker image ls
# Ensure image is create - mysqlwithdata:v1

# Now try to connect from MySql Workbench.

# See the image MySqlOnContainer.jpg

# Once connected, see that the data is also loaded. The server should conain a database and the database should contain table data.

# Finally, you try the following to run the app that connects to the mysql db runnon in a container on the vm

# But first the connection string should be adjusted. It would look like this.

# "MySqlConnection": "Server=20.163.187.121; Port=3306; Database=MySqlAppDb; Uid=root; Pwd=H@Sh1CoR3!; SslMode=Preferred;"

dotnet run --project ./../../dotnet-apps/0150-ConnectToMySqlAppWithConString/ConnectToMySqlAppWithConString/ConnectToMySqlAppWithConString.csproj

# Now get the ip of the vm.

# Browse to the ip address. You should see Nginx page. See the image NginxPage.jpg

# You can also connect to my sql database. First install mysql workbench on your local computer.

# Then you should be able to connect to it. See the image MySqlOnContainer.jpg

# You can also get into the running my sql contianer.

# First runt he following command to list the containers

sudo docker contianer ls

# Ensure the contianer named mysql-instance is presnet.

# Now run the following to get into the container
sudo docker exec -it mysql-instance mysql -uroot -p

# When asked for the pass, give it(one you gave it during provisioning. sudo docker run --name mysql-instance -p 3306:3306 --restart on-failure -d -e MYSQL_ROOT_PASSWORD=H@Sh1CoR3! mysql)

show databases;

## Thats it.

# Press Ctrl+C to comeout.

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
