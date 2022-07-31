# Resource-2: Create Network Interface
resource "azurerm_network_interface" "web_windowsvm_nic" {
  name                = "${local.resource_name_prefix}-web-windowsvm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "web-linuxvm-ip-1"
    subnet_id                     = azurerm_subnet.websubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web_windowsvm_publicip.id
    primary = true
  }
}


