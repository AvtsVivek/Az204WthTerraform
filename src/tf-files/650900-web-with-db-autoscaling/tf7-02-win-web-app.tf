# Resource-2: Azure Service Plan

resource "azurerm_service_plan" "service_plan" {
  name                = "${local.resource_name_prefix}-${var.service_plan_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = var.windows_sku_name
  os_type             = var.windows_os_type
  depends_on          = [azurerm_mssql_database.mssql_database]
}

# Resource-3: Azure Windows Web App

resource "azurerm_windows_web_app" "windows_web_app" {
  name                = "${local.resource_name_prefix}-${var.windows_web_app_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id
  connection_string {
    name  = "SQLConnection"
    type  = "SQLAzure"
    value = "Server=tcp:hr-dev-ms-sql-server.database.windows.net,1433;Initial Catalog=hr-dev-ms-sql-db;Persist Security Info=False;User ID=adm1n157r470r;Password=4-v3ry-53cr37-p455w0rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
  site_config {}

  logs {

    application_logs {
      file_system_level = "Information"
    }

    http_logs {
      file_system {
        retention_in_days = 1
        retention_in_mb   = 25
      }
    }

    detailed_error_messages = true

    failed_request_tracing = true
  }
}

resource "azurerm_monitor_autoscale_setting" "service_plan_auto_scale" {

  # depends_on = [
  #   azurerm_windows_web_app.windows_web_app
  # ]

  name                = "myAutoscaleSetting"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  target_resource_id  = azurerm_service_plan.service_plan.id
  profile {
    name = "default"
    capacity {
      default = 1
      minimum = 1
      maximum = 10
    }
    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_service_plan.service_plan.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 90
      }
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_service_plan.service_plan.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 10
      }
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}