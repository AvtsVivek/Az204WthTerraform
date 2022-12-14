cd ../../..

# cd into the directory.
cd ./src/tf-files/650700-web-with-db/

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 

terraform state list

# Once successifully provisioned, The next step is to load data into the database. run the data.sql script.

# See the image AddData.jpg in the images folder.

# Once the data is added, now prepare the project. Ensure the credentials are in place. 

# Take a look at the following file.

# https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/dotnet-apps/0040-ConnectToSqlapp/ConnectToSqlApp/Services/ProductService.cs

dotnet run --project ./../../dotnet-apps/0020-simple-webapp/simple-webapp.csproj

dotnet run --project ./../../dotnet-apps/0040-ConnectToSqlapp/ConnectToSqlapp/ConnectToSqlapp.csproj

# Or you can run the following as well. [In this following .net project example](https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/dotnet-apps/0050-ConnectToSqlAppWithConString/ConnectToSqlAppWithConString/Services/ProductService.cs), 
# This example, uses the [connection string here](https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/dotnet-apps/0050-ConnectToSqlAppWithConString/ConnectToSqlAppWithConString/appsettings.json). 

dotnet run --project ./../../dotnet-apps/0050-ConnectToSqlAppWithConString/ConnectToSqlAppWithConString/ConnectToSqlAppWithConString.csproj

# The following is a web api project
dotnet run --project ./../../dotnet-apps/0042-ConnectToSqlWebApi/ConnectToSqlWebApi.csproj

# To deploy first open VsCode in the folder of the project you want to deploy. 
# So if you want to deploy dotnet-apps/0020-simple-webapp/simple-webapp.csproj, first go to that folder
# cd dotnet-apps/0020-simple-webapp. Then follow the steps in the ReadMe.md file to deploy.

# Similarly you can deploy other web apps as well. 0040-ConnectToSqlapp and 0042-ConnectToSqlWebApi and 0050-ConnectToSqlAppWithConString

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
