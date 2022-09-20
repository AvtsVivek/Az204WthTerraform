cd ../../..

cd ./src/tf-files/860525-table-storage-access-with-dotnet

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

terraform state list

# Once you download the file, you should see it in the folder. See the image 


# For the following command to work, you need to pass on the resource, or data source.
# This resource or data source is got from terraform state list command
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

