cd ../../..

cd ./src/tf-files/890200-azure-key-vault-with-aad-app

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

# Output the password
terraform output app_name_password_value

terraform state list

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

