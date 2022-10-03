# Create a VM with a network security group

- This builds [on this](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/601010-linux-docker-nginx) where we build a vm, then provision with docker, then run an nginx contianer on it. Then you can access that page from internet, public IP. 

- The it additionaly adds [Azure Container Registry based on this](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/810010-azure-container-registry).

- Also we need to create [User Assigned Indetitie as explained here](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-authentication-managed-identity?tabs=azure-cli). Note we are creating user assigned identites, and not service assigned identities for this example.

- Then place that /src/in dotnet-apps folder

![The layout](./images/Layout.jpg)

- The following is the diagram downloaded from the Azure Portal.

![The Diagram](./images/topology.svg)

- References
  - https://docs.microsoft.com/en-us/azure/container-registry/container-registry-authentication-managed-identity?tabs=azure-cli
  
  - https://docs.microsoft.com/en-us/azure/container-registry/container-registry-roles?tabs=azure-cli

  - https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview

