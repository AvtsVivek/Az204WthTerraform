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

output "azurerm_windows_virtual_machine_web_windowsvm_id" {
  description = "Windows VM Id "
  value       = [azurerm_windows_virtual_machine.web_windowsvm.id]
}

