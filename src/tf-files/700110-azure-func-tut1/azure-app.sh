cd ../../..

# cd into the directory.
cd ./src/tf-files/700110-azure-func-tut1/

# Ensure necessary visual studio code extensions are installed. See InstallExtensionToVisualStudioCode.jpg in the images folder.

# The follwing is the tutorial that is followed.

https://docs.microsoft.com/en-us/azure/azure-functions/functions-develop-vs-code?tabs=nodejs

# The following Pre requisties are needed.
https://docs.microsoft.com/en-us/azure/azure-functions/functions-develop-vs-code?tabs=nodejs#prerequisites

cd ../../../src/js-apps

mkdir js-azure-func-app

cd js-azure-func-app

# Now move into the folder by opening vs code

# code . -r

code .

# Now there are two ways(more actually) to create an azure function. 

# First approach is to the vs code extension. For this see the images in the images folder.

# The next approach is to use the cli. The following is the reference.

# https://www.maxivanov.io/deploy-azure-functions-with-terraform/

cd ../../../src/js-apps

mkdir js-azure-func-cli

cd js-azure-func-cli

func init . --typescript

func new --name hello-world --template "HTTP trigger" --authlevel "anonymous"

npm install

npm start

curl http://localhost:7071/api/hello-world?name=Terraform

code . -r

# The following is not working(using the command) 
func azure functionapp publish hr-dev-win-func-app-duclbc.azurewebsites.net

# So use the UI method to deploy.

# See the images from CreateJsAzureFunction7.jpg. That should do the job.

# Now create and deploy a dotnet azure app.

cd ../../../src/dotnet-apps

mkdir 0080-AzureFunc

cd 0080-AzureFunc

func init . --worker-runtime dotnet-isolated --target-framework net6.0

code . 