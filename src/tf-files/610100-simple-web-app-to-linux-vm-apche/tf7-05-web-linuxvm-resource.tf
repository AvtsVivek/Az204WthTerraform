# Locals Block for custom data

locals {
  webvm_custom_data = <<CUSTOM_DATA
#!/bin/sh

sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd  
sudo systemctl stop firewalld
sudo systemctl disable firewalld

sudo systemctl restart httpd

sudo curl -L "https://dot.net/v1/dotnet-install.sh" -o /tmp/dotnet-install.sh
sudo chmod 777 /tmp/dotnet-install.sh
sudo /tmp/dotnet-install.sh -c 6.0

sudo /usr/sbin/setsebool httpd_can_network_connect 1
sudo /usr/sbin/setsebool -P httpd_can_network_connect 1

sudo chmod 777 /etc/httpd/conf/
sudo chmod 777 /etc/httpd/conf/httpd.conf

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

  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#custom_data
  # custom_data = filebase64("${path.module}/app-scripts/redhat-webvm-script.sh")
  # custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
  custom_data = base64encode(local.webvm_custom_data)
}
