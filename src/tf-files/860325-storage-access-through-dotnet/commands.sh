cd ../../..

cd ./src/tf-files/860325-storage-access-through-dotnet

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

terraform state list

# Now the time to run the dotnet app. 
dotnet build ./../../dotnet-apps/0160-CreateStorageBlobContainer/CreateStorageBlobContainer/CreateStorageBlobContainer.csproj

# For the following execute command to run successifully, the file 'data.sql' must be present in the following folder
# ./src/tf-files/860325-storage-access-through-dotnet

dotnet run --project ./../../dotnet-apps/0160-CreateStorageBlobContainer/CreateStorageBlobContainer/CreateStorageBlobContainer.csproj

# For the following command to work, you need to pass on the resource, or data source.
# This resource or data source is got from terraform state list command
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

