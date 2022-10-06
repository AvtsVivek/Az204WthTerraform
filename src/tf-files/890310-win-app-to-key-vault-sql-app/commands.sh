cd ../../..

cd ./src/tf-files/890310-win-app-to-key-vault-sql-app

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

dotnet build ./../../dotnet-apps/0375-AzureKeyValutFromWebSqlApiAccess/AzureKeyValutFromWebSqlApiAccess.csproj

dotnet run --project ./../../dotnet-apps/0375-AzureKeyValutFromWebSqlApiAccess/AzureKeyValutFromWebSqlApiAccess.csproj

# Browse to something like this. https://localhost:7291/swagger/index.html. Dont forget to add swagger/index.html

# Press Ctrl + C to exit.

# Now deploy this dotnet app. See the folder src\tf-files\650700-web-with-db\images to know how to deploy using VS Code

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

