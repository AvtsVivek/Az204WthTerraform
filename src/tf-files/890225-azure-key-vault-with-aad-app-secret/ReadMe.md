# Azure Key Vault

- The objective is to demo an dotnet 6 app accessing a connection string(any secret for that matter) which is present as a secret inside of a Azure Key Vault.

- This example extends a previous example. This example, deploys an Azure Key Vault. And then inside of it a secret. That secret will contain a connection string. 

- This example also deploys a application object along with a service principal. Necessary Access Policy is also configured on the key vault which allows access to this applicatioin object.

- Apart from those two, an sql server and a database is also deployed. 

![Sql Server](./images/20AfterDeploymentReview40.jpg)


- Once the database is deployed, add your client ip address, see the image 20AfterDeploymentReview50.jpg

![Sql Server](./images/20AfterDeploymentReview50.jpg)

- Once the client address is added, try connecting to that database using SSMS. And then load the data. See the images 

![SSMS Connection](./images/20AfterDeploymentReview60.jpg)

![SSMS Connection](./images/20AfterDeploymentReview70.jpg)


# 