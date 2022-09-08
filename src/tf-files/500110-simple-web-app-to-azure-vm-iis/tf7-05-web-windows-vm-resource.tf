resource "azurerm_windows_virtual_machine" "web_windowsvm" {
  name                = "${local.resource_name_prefix}-winvm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"     # "admin" This simple one is not working.
  admin_password      = "P@$$w0rd1234!" # "123" This simple is not working.
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

    # sku = "2022-Datacenter" #
    sku = "2019-Datacenter"
    # The following is not working.
    # sku       = "2019-datacenter-gensecond"
    version = "latest"
  }
  custom_data = filebase64("./${var.powershell_script_file_name}")
}

resource "time_sleep" "wait_for_some_time" {
  depends_on      = [azurerm_windows_virtual_machine.web_windowsvm]
  create_duration = "360s"
}

resource "azurerm_virtual_machine_extension" "iis-windows-vm-extension" {
  name                 = "windows-vm-extension"
  virtual_machine_id   = azurerm_windows_virtual_machine.web_windowsvm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  # settings             = <<SETTINGS
  #   { 
  #     "commandToExecute": "powershell Install-WindowsFeature -name Web-Server -IncludeManagementTools;Install-WindowsFeature -Name Web-Mgmt-Service -IncludeAllSubFeature;Set-ItemProperty -Path 'HKLM:\\Software\\Microsoft\\WebManagement\\Server' -Name EnableRemoteManagement -Value 1"
  #   } 
  # SETTINGS
  settings = <<SETTINGS
    {
        "commandToExecute": "powershell -ExecutionPolicy unrestricted -NoProfile -NonInteractive -command \"cp c:/azuredata/customdata.bin c:/azuredata/install.ps1; c:/azuredata/install.ps1\""
    }
    SETTINGS

  depends_on = [time_sleep.wait_for_some_time]

}
