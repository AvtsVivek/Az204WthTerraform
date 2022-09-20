cd ../../..

cd ./src/tf-files/870100-cosmos-mongo

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

# var connectionString = "DefaultEndpointsProtocol=https;AccountName=staticwebsiteqmvtgi;AccountKey=PVqBjgwnvGRaVqqa93o0LYs4JGbP+vCfyGjBWVeNr58UnfsSKS9L7/jPXYOVc39jLUMVngTTmheb+AStAtXz6A==;EndpointSuffix=core.windows.net";
# var tableName = "mysampletable";

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

