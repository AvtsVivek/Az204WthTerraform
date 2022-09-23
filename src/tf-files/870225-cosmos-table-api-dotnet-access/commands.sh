cd ../../..

cd ./src/tf-files/870225-cosmos-table-api-dotnet-access

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

terraform state list

# Once deployed, get the connection string. See the image # 1TableStorage2.jpg

# Update the Connection string.
# https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/dotnet-apps/0170-TableStorage/TableStorage/Program.cs

# var connectionString = "DefaultEndpointsProtocol=https;AccountName=vivek-pmwcio-cosmos-db-account;AccountKey=2GaLtM63DA1qDOF1UT8ak68R2vIkFNxZeCL24u6oRyCP1n4an68JUi9LWAf1BBWR5dPot1qX9jw26fIlwFapUg==;TableEndpoint=https://vivek-pmwcio-cosmos-db-account.table.cosmos.azure.com:443/";
# var tableName = "vivek-cosmos-table-db";

# Now the time to run the dotnet app. See 1TableDeployment4.jpg 
dotnet build ./../../dotnet-apps/0170-TableStorage/TableStorage/TableStorage.csproj

# Now data should be in the table. See 1TableDeployment3.jpg

dotnet run --project ./../../dotnet-apps/0170-TableStorage/TableStorage/TableStorage.csproj

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
