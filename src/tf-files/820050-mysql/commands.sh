
# cd into the directory.
cd ./src/tf-files/820050-mysql/

cd ../../..

terraform fmt

terraform init

terraform validate

terraform plan -var-file="secrets.tfvars" -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 

# Once successifully provisioned, The next step is to load data into the database. run the data.sql script.

# See the image AddData.jpg

# Once the data is added, now prepare the project. Ensure the credentials are in place. 

# Take a look at the following file.

# https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/dotnet-apps/0040-ConnectToSqlapp/ConnectToSqlApp/Services/ProductService.cs

dotnet run --project ./../../dotnet-apps/0150-ConnectToMySqlAppWithConString/ConnectToMySqlAppWithConString/ConnectToMySqlAppWithConString.csproj

terraform state show 

terraform show terraform.tfstate

terraform plan -destroy -out main.destroy.tfplan -var-file="secrets.tfvars"

# terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan

Remove-Item -Recurse -Force .terraform/modules

Remove-Item -Recurse -Force .terraform

Remove-Item terraform.tfstate

Remove-Item terraform.tfstate.backup

Remove-Item main.tfplan

Remove-Item main.destroy.tfplan

Remove-Item .terraform.lock.hcl
