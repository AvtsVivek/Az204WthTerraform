# Virtual Network Outputs
## Virtual Network Name, argument reference
output "virtual_network_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.vnet.name
}
## Virtual Network ID, attribute reference
output "virtual_network_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

# Subnet Outputs (We will write for one web subnet and rest all we will ignore for now)
## Subnet Name, argument reference
output "web_subnet_name" {
  description = "WebTier Subnet Name"
  value       = azurerm_subnet.websubnet.name
}

## Subnet ID, attribute reference
output "web_subnet_id" {
  description = "WebTier Subnet ID"
  value       = azurerm_subnet.websubnet.id
}

# Network Security Outputs
## Web Subnet NSG Name, argument reference
output "web_subnet_nsg_name" {
  description = "WebTier Subnet NSG Name"
  value       = azurerm_network_security_group.web_subnet_nsg.name
}

## Web Subnet NSG ID, attribute reference
output "web_subnet_nsg_id" {
  description = "WebTier Subnet NSG ID"
  value       = azurerm_network_security_group.web_subnet_nsg.id
}
