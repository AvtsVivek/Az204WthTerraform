# Create a VM with a network security group

- This builds [on this](https://github.com/AvtsVivek/AzureWithTerraformAdvanced/tree/main/iac/2101100-vnet-vm-nsg)

- Deploys a linux VM, then provisions a docker, then starts a docker nginx container. 
  
- Then you can access that page from internet, public IP. But WAIT FOR SOME TIME, to fully install.
  - Login into the vm using ssh and use the following command to see how the docker is beiing installed.
  - tail -100f cloud-init-output.log

- Bastion subnet, app subnet and db subnet are removed.

- Web Network Security Group can be considered as the first level.

- VM Network Security Group(Optional) can be considered as the second level.

- Get the dotnet-install.sh script from here. https://docs.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install

- Then place that /src/in dotnet-apps folder

![The layout](./Images/Layout.jpg)

- The following is the diagram downloaded from the Azure Portal.

![The Diagram](./Images/topology.svg)

