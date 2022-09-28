# Trying to understand service principal.

# Need to understand more.

- References:
  - [Create Service Principal](https://learn.microsoft.com/en-us/powershell/azure/create-azure-service-principal-azureps?view=azps-8.3.0)
  - [Service Accounts Principal](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/service-accounts-principal)
  - [App Objects and Service Principals](https://learn.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals)
  - [App Registration Quick Start](https://learn.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app)
  - [So Question Reference](https://stackoverflow.com/questions/71067014/error-while-trying-to-do-app-registration-using-terraform-azure-ad-provider-2-0)
  - [Code Samples](https://learn.microsoft.com/en-us/azure/active-directory/develop/sample-v2-code)
  - [What is Service Principal](https://stackoverflow.com/q/48096342/1977871)
  - [How to Create Sp](https://www.sanganakauthority.com/2019/04/how-to-create-service-principal-or-app.html)

- Questions
  - Is the appliction object an abstraction to Service Principal?
  - Is there a one to one mapping between service principal to application object? The Service Principal object id and object id outputs are different. 
  - So if the application object is deleted, will the underling sp will also get deleted?