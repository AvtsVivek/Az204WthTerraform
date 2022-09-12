# Locals Block for custom data

# sudo curl -L "https://dot.net/v1/dotnet-install.sh" -o /tmp/dotnet-install.sh
# sudo chmod 777 /tmp/dotnet-install.sh
# sudo /tmp/dotnet-install.sh -c 6.0
# sudo /usr/sbin/setsebool httpd_can_network_connect 1
# sudo /usr/sbin/setsebool -P httpd_can_network_connect 1

locals {
  webvm_custom_data = <<CUSTOM_DATA
#!/bin/bash

echo $PWD

# You can put any bash commands here to execute after the deployment.
# The execution of this script is taken care by terraform.
# But the downside of this is, this happens immediately after the deployment. 
# So if you need to pass on any files to the vm before running any of the scripts,
# and you want to use those files in running the scripts, then this is not ideal. 
# This scipt executes before any terraform file provisioner is executed.
# So its better to use remote-exec provisioner in such cases. 

echo "Some change so the vm resource will be tained.  "

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

  connection {
    type        = "ssh"
    host        = self.public_ip_address
    user        = self.admin_username
    password    = 123
    private_key = file("${path.module}/ssh-keys/terraform-azure.pem")
  }

  # File Provisioner-1: Copies the file-copy.html file to /tmp/file-copy.html
  provisioner "file" {
    source      = "./custom-docker-image-files/"
    destination = "/tmp/"
  }


  provisioner "remote-exec" {
    inline = [
      "touch /tmp/executionlogs.txt",
      "chmod +x /tmp/provisionscript.sh",
      "chmod +w /tmp/executionlogs.txt",
      "echo $PWD >> /tmp/executionlogs.txt",
      "dir >> /tmp/executionlogs.txt",
      "/tmp/provisionscript.sh >> /tmp/executionlogs.txt"
    ]
  }
}
