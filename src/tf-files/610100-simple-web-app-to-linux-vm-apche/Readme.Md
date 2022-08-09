# Create a VM with a network security group

- This builds [on this](https://github.com/AvtsVivek/AzureWithTerraformAdvanced/tree/main/iac/2101100-vnet-vm-nsg)

- Bastion subnet, app subnet and db subnet are removed.

- Web Network Security Group can be considered as the first level.

- VM Network Security Group(Optional) can be considered as the second level.

- Get the dotnet-install.sh script from here. https://docs.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install

- Then place that /src/in dotnet-apps folder



![The layout](./Images/Layout.jpg)

- The following is the diagram downloaded from the Azure Portal.

![The Diagram](./Images/topology.svg)

- Reference. https://www.c-sharpcorner.com/article/deploying-asp-net-web-application-to-a-linux-virtual-machine-in-azure/

- 
