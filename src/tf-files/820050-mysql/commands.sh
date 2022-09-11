
# cd into the directory.
cd ./src/tf-files/820050-mysql/

cd ../../..

terraform fmt

terraform init

terraform validate

terraform plan -var-file="secrets.tfvars" -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 


docker-compose up -d


terraform state show 

terraform show terraform.tfstate

terraform plan -destroy -out main.destroy.tfplan -var-file="secrets.tfvars"

# terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan

Remove-Item -Recurse -Force .terraform/modules

Remove-Item -Recurse -Force .terraform

Remove-Item terraform.tfstate

Remove-Item terraform.tfstate.backup

Remove-Item main.tfplan

Remove-Item main.destroy.tfplan

Remove-Item .terraform.lock.hcl
