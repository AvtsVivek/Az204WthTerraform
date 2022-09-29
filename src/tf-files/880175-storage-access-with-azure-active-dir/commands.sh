cd ../../..

cd ./src/tf-files/880175-storage-access-with-azure-active-dir

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

terraform state list

# For the following command to work, you need to pass on the resource, or data source.
# This resource or data source is got from terraform state list command
terraform state show 

# Now the time to run the dotnet app. 
dotnet build ./../../dotnet-apps/0250-StoreAccountWithAzureAppObject/StoreAccountWithAzureAppObject.csproj

# Go to the StoreAccountWithAzureAppObject.csproj folder.
# Find Program.cs
# Then update the follwoing four lines.

# var tenantId = "35b02984-c026-40c5-8cb3-2267c184d48a";
# var clientId = "b51a4f4d-d3f9-4421-b87b-ee9777571572";
# var clientSecret = "Kik8Q~~kueC-5aN952eHNaMPAb6cdB7-Cs7u0bIz";
# var blobURI = "https://staticwebsitemkxmzz.blob.core.windows.net/content/error.html";

# See the images, 30GetApplicationObjectCredentials10.jpg to 30GetApplicationObjectCredentials30.jpg to get the credentials
# For client secret, you need to generate it. See 30GetApplicationObjectCredentials30.jpg
# Also get the blobURI and update it. See the image 30GetApplicationObjectCredentials30.jpg and 30GetApplicationObjectCredentials40.jpg
# Then run the following. error1.html file should be downloaded after successifully running the following command.

dotnet run --project ./../../dotnet-apps/0250-StoreAccountWithAzureAppObject/StoreAccountWithAzureAppObject.csproj

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

