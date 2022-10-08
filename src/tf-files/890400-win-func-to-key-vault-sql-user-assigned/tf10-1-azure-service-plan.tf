
## service plan name

variable "service_plan_name" {
  description = "service plan name"
  type        = string
  default     = "win-service-plan"
}

variable "windows_sku_name" {
  description = "windows web app SKU name "
  type        = string
  # default     = "P1v2"
  default = "S1"
}

variable "windows_os_type" {
  description = "windows web app OS Type "
  type        = string
  default     = "Windows"
}

resource "azurerm_service_plan" "service_plan_for_azure_func" {
  name                = "${local.resource_name_prefix}-${var.service_plan_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  os_type  = var.windows_os_type
  sku_name = var.windows_sku_name
}