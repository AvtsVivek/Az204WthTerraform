## service plan name

variable "service_plan_name" {
  description = "service plan name"
  type        = string
  default     = "win-service-plan"
}

variable "windows_web_app_name" {
  description = "windows web app name"
  type        = string
  default     = "win-web-app"
}

variable "windows_sku_name" {
  description = "windows web app SKU name "
  type        = string
  default     = "P1v2"
}

variable "windows_os_type" {
  description = "windows web app OS Type "
  type        = string
  default     = "Windows"
}