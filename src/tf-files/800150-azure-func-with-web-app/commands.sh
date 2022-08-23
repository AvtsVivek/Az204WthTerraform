cd ../../..

# cd into the directory.
cd ./src/tf-files/800140-azure-func-dotnet-conn-string-env-var/

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 

terraform state list

# Once successifully provisioned, the next step is to get the access key.

# See the image AppConfiguration1.jpg in the images folder.

# Take a look at the following file.

# https://github.com/AvtsVivek/Az204WthTerraform/blob/9c325df5ee389ce3e2b742a39f3f1bf62fa43834/src/dotnet-apps/0060-ConnectToAzureConfig/ConnectToAzureConfig/Program.cs#L6

# Get the access key and update it.

dotnet run --project ./../../dotnet-apps/0060-ConnectToAzureConfig/ConnectToAzureConfig/ConnectToAzureConfig.csproj

# See the image AppConfiguration4.jpg in the images folder.

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
