# Storage Accounts

- This builds on the previous blob storage demo, but this changes the access level of a container using the container resource.
  - azurerm_storage_container

- See below for differnt types of access. Access Keys, Shared Access Signatures at blob leve, at account level 

- See the images. 

- Once the terraform config files are applied, take a look at the Azure Active Directory. A user should be created.

- ![Container](./images/1ActiveDirectory1.jpg)

- ![Container](./images/1ActiveDirectory2.jpg)

- ![Container](./images/1ActiveDirectory3.jpg)

- Now Azure Storage Account. It should have a container with name content.

- ![Container](./images/2Rg1.jpg)

- ![Container](./images/2Rg2.jpg)

- ![Container](./images/3StorageAccount1.jpg)

- Now the role assignment for the created user. The user should be assigned Storage Account Contributor role. 

- ![Container](./images/3StorageAccount2.jpg)

- Now you should be able to login from Azure Storage Explorer.

- ![Container](./images/4MsAzureStorageExplorer1.jpg)

- ![Container](./images/4MsAzureStorageExplorer2.jpg)

- ![Container](./images/4MsAzureStorageExplorer3.jpg)

- ![Container](./images/4MsAzureStorageExplorer4.jpg)

- ![Container](./images/4MsAzureStorageExplorer5.jpg)

- ![Container](./images/4MsAzureStorageExplorer5.jpg)

- Now signin with newly created user.

- ![Container](./images/50LoginFromPortal1.jpg)

- ![Container](./images/50LoginFromPortal2.jpg)

- ![Container](./images/50LoginFromPortal3.jpg)

- ![Container](./images/50LoginFromPortal4.jpg)

- ![Container](./images/50LoginFromPortal5.jpg)

- ![Container](./images/50LoginFromPortal6.jpg)

- Now look for Storage Account.

- ![Container](./images/50LoginFromPortal7.jpg)

- ![Container](./images/50LoginFromPortal8.jpg)

- ![Container](./images/50LoginFromPortal9.jpg)

- ![Container](./images/50LoginFromPortal10.jpg)

- ![Container](./images/50LoginFromPortal11.jpg)

- Also look for the properties of the newly created user.

- ![Container](./images/60ActiveDirectory1.jpg)

- ![Container](./images/60ActiveDirectory2.jpg)
  
- ![Container](./images/60ActiveDirectory3.jpg)

- ![Container](./images/60ActiveDirectory4.jpg)

- ![Container](./images/60ActiveDirectory5.jpg)

- ![Container](./images/60ActiveDirectory6.jpg)

-  
