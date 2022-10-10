cd ../../..

cd ./src/tf-files/403000-app-reg-oauth

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

# Now the time to run the dotnet app. 
dotnet build ./../../dotnet-apps/0600-WebAppOAuthWithAAD/WebAppOAuthWithAAD.csproj

dotnet run --project ./../../dotnet-apps/0600-WebAppOAuthWithAAD/WebAppOAuthWithAAD.csproj

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

