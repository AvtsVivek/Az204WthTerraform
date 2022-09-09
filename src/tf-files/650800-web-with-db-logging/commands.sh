cd ../../..

# cd into the directory.
cd ./src/tf-files/650800-web-with-db-logging/

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

dotnet run --project ./../../dotnet-apps/0040-ConnectToSqlapp/ConnectToSqlapp/ConnectToSqlapp.csproj

# Or you can run the following as well. [In this following .net project example](https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/dotnet-apps/0050-ConnectToSqlAppWithConString/ConnectToSqlAppWithConString/Services/ProductService.cs), 
# This example, uses the [connection string here](https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/dotnet-apps/0050-ConnectToSqlAppWithConString/ConnectToSqlAppWithConString/appsettings.json). 

dotnet run --project ./../../dotnet-apps/0050-ConnectToSqlAppWithConString/ConnectToSqlAppWithConString/ConnectToSqlAppWithConString.csproj

# you can deploy the folloing also, just to check the logs.

dotnet run --project ./../../dotnet-apps/0020-simple-webapp/simple-webapp.csproj

# To produce logs, you have to browse the app, like privacy, home etc. 
# But note that the browser can do caching and so an actual request may not go the server, 
# and so you may not see the logs actually. So ensure you use a new browser, or remove the cacheing.

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
