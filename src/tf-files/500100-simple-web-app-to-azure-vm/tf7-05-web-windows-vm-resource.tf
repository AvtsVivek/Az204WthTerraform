resource "azurerm_windows_virtual_machine" "web_windowsvm" {
  name                = "${local.resource_name_prefix}-winvm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.web_windowsvm_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"

    sku = "2019-Datacenter"
    # The following is not working.
    # sku       = "2019-datacenter-gensecond"
    version = "latest"
  }
}
