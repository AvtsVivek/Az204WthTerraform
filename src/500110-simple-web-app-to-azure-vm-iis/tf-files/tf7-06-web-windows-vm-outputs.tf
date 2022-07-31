## Public IP Address
# output "web_linuxvm_public_ip" {
#   description = "Web Linux VM Public Address"
#   value       = azurerm_public_ip.web_windowsvm_publicip.ip_address
# }

# Network Interface Outputs
## Network Interface ID
output "web_windowsvm_network_interface_id" {
  description = "Web Windows VM Network Interface ID"
  value       = azurerm_network_interface.web_windowsvm_nic.id
}
## Network Interface Private IP Addresses
output "web_windowsvm_network_interface_private_ip_addresses" {
  description = "Web Windows VM Private IP Addresses"
  value       = [azurerm_network_interface.web_windowsvm_nic.private_ip_addresses]
}

# Linux VM Outputs

# ## Virtual Machine Public IP
# output "web_linuxvm_public_ip_address" {
#   description = "Web Linux Virtual Machine Public IP"
#   value       = azurerm_linux_virtual_machine.web_linuxvm.public_ip_address
# }


# ## Virtual Machine Private IP
# output "web_linuxvm_private_ip_address" {
#   description = "Web Linux Virtual Machine Private IP"
#   value       = azurerm_linux_virtual_machine.web_linuxvm.private_ip_address
# }
# ## Virtual Machine 128-bit ID
# output "web_linuxvm_virtual_machine_id_128bit" {
#   description = "Web Linux Virtual Machine ID - 128-bit identifier"
#   value       = azurerm_linux_virtual_machine.web_linuxvm.virtual_machine_id
# }
# ## Virtual Machine ID
# output "web_linuxvm_virtual_machine_id" {
#   description = "Web Linux Virtual Machine ID "
#   value       = azurerm_linux_virtual_machine.web_linuxvm.id
# }




