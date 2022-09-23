cd ../../..

cd ./src/tf-files/870250-cosmos-table-api-dotnet-access-stored-procs

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

terraform state list

# Once deployed, get the keys. See the image # 1AfterDeployment5.jpg

# Update the following.
# var cosmosDBEndpointUri = "https://vivek-pmwcio-cosmos-db-account.documents.azure.com:443/";
# var cosmosDBKey = "r2vxTL1U6GkmkdrqU8HMxzyORIsjclaDERb3tVdYoXNLr1OoCG58Nk7sKL5gCQZAIYy5SNijehiCvYZcmMGREA==";
# var databaseName = "vivek-cosmos-sql-db";
# var containerName = "vivek-cosmos-sql-db-category-container";

# Now the time to run the dotnet app. See 
dotnet build ./../../dotnet-apps/0200-CosmosStoredProcs/CosmosStoredProcs/CosmosStoredProcs.csproj

# Now data should be in the table. See 1TableDeployment3.jpg
dotnet run --project ./../../dotnet-apps/0200-CosmosStoredProcs/CosmosStoredProcs/CosmosStoredProcs.csproj

# Note this same app is used in the following example as well.
# https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/860525-table-storage-access-with-dotnet
# Take a look at this file
# https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/tf-files/860525-table-storage-access-with-dotnet/commands.sh
# The connection string needs to be updated, and the table name.

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
