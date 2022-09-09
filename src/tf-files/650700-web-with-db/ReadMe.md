Sql Server and Sql Database with web app service

- Run the terraform files to create the required resources.
  - While creating, getting [this error as described in this github issue](https://github.com/hashicorp/terraform-provider-azurerm/issues/18311). So workaround is continue to execute the command plan and apply repeatedly. 

- Creates a Sql Server and Sql Database and windows web app.

- Visual Studio 2022 Deployment is not woring. So you can use Vs Code.

- Deployed resources
![Deployed Resources](./images/DeployedResources.jpg)

- Settings to Sql Server
![Settings to Sql Server](./images/AddClientToDbFireWall.jpg)

- Add data
![Add data](./images/AddData.jpg)

- Locally running web app
![Add data](./images/LocalRunningWebApp.jpg)

- First add the required extensiions
![Vs code Extension](./images/VsCodeExtensions.jpg)

- Then Sign in to Azure. Press F1 in VsCode and then type Azure: Sign in
![Sign in to Azure](./images/VsCodeAzureExtensionsAfterSignIn.jpg)

- Then Sign in to Azure. Press F1 in VsCode and then type Azure: Sign in
![Sign in to Azure](./images/VsCodeAzureSignIn.jpg)

- Now deploy
  
- To deploy first open VsCode in the folder of the project you want to deploy. 
  - So if you want to deploy dotnet-apps/0020-simple-webapp/simple-webapp.csproj, first go to that folder
  -  cd dotnet-apps/0020-simple-webapp. Then follow the steps to deploy.
![Vs code Extension](./images/DeployWithVsCodeExtensions.jpg)

- There seems to be some problem with deployment currently. 
![Vs code Extension](./images/SomeProblemWithDeployment.jpg)


