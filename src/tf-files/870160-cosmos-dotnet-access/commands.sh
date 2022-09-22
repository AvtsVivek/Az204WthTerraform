cd ../../..

cd ./src/tf-files/870160-cosmos-dotnet-access

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

terraform state list

# Now the time to run the dotnet app. 
# dotnet build ./../../dotnet-apps/0160-CreateStorageBlobContainer/CreateStorageBlobContainer/CreateStorageBlobContainer.csproj
dotnet build ./../../dotnet-apps/0180-CosmosApp/CosmosApp/CosmosApp.csproj

# Run the prject to create the database and container. 
dotnet run --project ./../../dotnet-apps/0180-CosmosApp/CosmosApp/CosmosApp.csproj

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

