# Locals Block for custom data

# sudo curl -L "https://dot.net/v1/dotnet-install.sh" -o /tmp/dotnet-install.sh
# sudo chmod 777 /tmp/dotnet-install.sh
# sudo /tmp/dotnet-install.sh -c 6.0
# sudo /usr/sbin/setsebool httpd_can_network_connect 1
# sudo /usr/sbin/setsebool -P httpd_can_network_connect 1

locals {
  webvm_custom_data = <<CUSTOM_DATA
#!/bin/sh

sudo systemctl stop firewalld
sudo systemctl disable firewalld

echo "Adding repo to config manager"

sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

echo "Adding repo to config manager - DONE"

echo "Starting to install docker-ce "

sudo dnf install docker-ce -y

echo "Starting to install docker-ce - DONE "

echo "Starting to install docker-ce-cli "

sudo dnf install docker-ce-cli -y

echo "Starting to install docker-ce-cli - DONE "

echo "Starting to install containerd.io"

sudo dnf install containerd.io -y

echo "Starting to install containerd.io - DONE "

echo "Starting to install docker-compose-plugin"

sudo dnf install docker-compose-plugin -y

echo "Starting to install docker-compose-plugin - DONE "

sudo systemctl start docker

sudo systemctl start firewalld
sudo systemctl enable firewalld

sudo iptables -t filter -F
iptables -t filter -X
systemctl restart docker

echo "Starting docker nginx conainer "

sudo docker run --name appnginx -p 80:80 -d nginx

echo "Starting docker nginx conainer - DONE"

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
