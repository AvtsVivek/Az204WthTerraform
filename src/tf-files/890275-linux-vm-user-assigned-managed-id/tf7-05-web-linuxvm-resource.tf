# Locals Block for custom data
# https://learn.microsoft.com/en-us/dotnet/core/install/linux-fedora

# sudo dnf install dotnet-runtime-6.0 -y
# sudo dnf install aspnetcore-runtime-6.0 -y

# sudo chmod 777 /tmp/dotnet-install.sh
# sudo /tmp/dotnet-install.sh -c 6.0

locals {
  webvm_custom_data = <<CUSTOM_DATA
#!/bin/sh

sudo yum install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl stop firewalld
sudo systemctl disable firewalld

sudo systemctl restart nginx

echo "Installing dotnet by executing the command - sudo dnf install aspnetcore-runtime-6.0"

sudo dnf install dotnet-runtime-6.0 -y

echo "Installation complete. Execution of the command 'sudo dnf install aspnetcore-runtime-6.0' is done"


sudo /usr/sbin/setsebool httpd_can_network_connect 1
sudo /usr/sbin/setsebool -P httpd_can_network_connect 1

sudo chmod 777 /etc/nginx/nginx.conf
sudo chmod 777 /etc/nginx/default.d
sudo chmod 777 /etc/nginx/conf.d

sudo cp -r /root/.dotnet /usr/dotnet

sudo rm -r -f /root/.dotnet

sudo mkdir /etc/nginx/sites-enabled

sudo chmod 777 /etc/nginx/sites-enabled

CUSTOM_DATA
}


# Resource: Azure Linux Virtual Machine
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  name = "${local.resource_name_prefix}-web-linuxvm"
  # If the following computer_name is not set, it will be automatically be set to the name argument.
  #computer_name = "web-linux-vm" # Hostname of the VM (Optional)

  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_DS1_v2"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.web_linuxvm_nic.id]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }

  # identity {
  #   type = "SystemAssigned"
  # }

  identity {
    type         = "UserAssigned" #"SystemAssigned"
    identity_ids = [azurerm_user_assigned_identity.appag_umid.id]
  }


  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#custom_data
  # custom_data = filebase64("${path.module}/app-scripts/redhat-webvm-script.sh")
  # custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
  custom_data = base64encode(local.webvm_custom_data)
}
