cd ../../..

cd ./src/tf-files/870160-cosmos-dotnet-access

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

terraform state list

# Add items to the container. See the images. Use Grocery.json.

# Once the items are added, we can query.

# The following queries can be executed.

# You can now update the 

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

