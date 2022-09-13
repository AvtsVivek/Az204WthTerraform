
# cd into the directory.
cd ./src/tf-files/601060-container-group-viveknginx/

cd ../../..

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


terraform state show 

terraform show terraform.tfstate

terraform plan -destroy -out main.destroy.tfplan

# terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan
