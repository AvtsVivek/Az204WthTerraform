# Create a VM with a network security group

- Objective
  - This app runs on a vm and downloads a file in a container located on a storage account.
  - The vm is configured with a SystemAssigned Managed Service identity.
  - And this identity is assigned the roles of Reader and Storage Blob Data Reader scoped to the storage account.

- Deploy a linux vm. Install dotnet run time. 

- This builds from [630100-simple-web-app-to-linux-vm-ngnx](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/630100-simple-web-app-to-linux-vm-ngnx)

- Next [810035-acr-docker-vm-system-assigned](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/810035-acr-docker-vm-system-assigned) shows a system assigned example. Role assignment is picked from there.

- Also finally 