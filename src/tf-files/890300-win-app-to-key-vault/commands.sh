cd ../../..

cd ./src/tf-files/890300-win-app-to-key-vault

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

# Output the password
terraform output app_name_password_value

# Need to update the following variable in the file 
# ./../../dotnet-apps/0280-AzureKeyVaultSecretsSqlAppAccess/Services/ProductService.cs

# var tenantId = "35b02984-c026-40c5-8cb3-2267c184d48a";
# var clientId = "ab0adc88-52b7-4c2b-b47d-66814eb84af0";
# var clientSecret = "0iO8Q~fsNhL97YRXpYcqLwIekgJziyOyfPRGPcA0";
# var keyvaultUrl = "https://vivek-jgybpk-my-rg.vault.azure.net/";

# See the images 10AfterDeploymentReview20.jpg etc, they should help.

# Web App
dotnet build ./../../dotnet-apps/0280-AzureKeyVaultSecretsSqlAppAccess/AzureKeyVaultSecretsSqlAppAccess.csproj
dotnet run --project ./../../dotnet-apps/0280-AzureKeyVaultSecretsSqlAppAccess/AzureKeyVaultSecretsSqlAppAccess.csproj

# Press Ctrl + C to exit.

# Now try Web Api. First update the vars in the file.
# ./../../dotnet-apps/0285-AzureKeyVaultSecretsWebApiAccess/Services/ProductService.cs
dotnet build ./../../dotnet-apps/0285-AzureKeyVaultSecretsWebApiAccess/AzureKeyVaultSecretsWebApiAccess.csproj
dotnet run --project ./../../dotnet-apps/0285-AzureKeyVaultSecretsWebApiAccess/AzureKeyVaultSecretsWebApiAccess.csproj

# Once running, browse to something like, https://localhost:7291/swagger/index.html

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

