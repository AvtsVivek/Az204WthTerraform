cd ../../..

cd ./src/tf-files/890225-azure-key-vault-with-aad-app-secret

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

# Output the password
terraform output app_name_password_value

# Need to update the following variable in the file 
# ./../../dotnet-apps/0270-AzureKeyVaultAccess/Program.cs

# var tenantId = "35b02984-c026-40c5-8cb3-2267c184d48a";
# var clientId = "ab0adc88-52b7-4c2b-b47d-66814eb84af0";
# var clientSecret = "0iO8Q~fsNhL97YRXpYcqLwIekgJziyOyfPRGPcA0";
# var keyvaultUrl = "https://vivek-jgybpk-my-rg.vault.azure.net/";

# See the images 10AfterDeploymentReview20.jpg etc, they should help.

dotnet build ./../../dotnet-apps/0270-AzureKeyVaultAccess/AzureKeyVaultAccess.csproj

dotnet run --project ./../../dotnet-apps/0270-AzureKeyVaultAccess/AzureKeyVaultAccess.csproj

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

