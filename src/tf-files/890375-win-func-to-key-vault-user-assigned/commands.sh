cd ../../..

cd ./src/tf-files/890375-win-func-to-key-vault-user-assigned

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan


# Need to update the following variable in the file 
# ./../../dotnet-apps/0375-AzureKeyValutFromWebSqlApiAccess/Constants.cs
# public static string KeyvaultUrl = "https://s-by-s-wyiyot-keyvault.vault.azure.net/";

# Web App, Open Vs code 
# dotnet-apps\0500-AzureFuncKeyVaultAccess
dotnet build ./../../dotnet-apps/0500-AzureFuncKeyVaultAccess/AzureFuncKeyVaultAccess.csproj

# Now deloy this project to app. See the images. 20FunctionApp35.jpg

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

