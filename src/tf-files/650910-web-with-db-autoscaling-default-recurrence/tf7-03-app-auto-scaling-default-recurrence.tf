
resource "azurerm_monitor_autoscale_setting" "service_plan_auto_scale" {

  depends_on = [
    azurerm_windows_web_app.windows_web_app
  ]

  name                = "myAutoscaleSetting"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  target_resource_id  = azurerm_service_plan.service_plan.id
  # Notification  
  notification {
    email {
      send_to_subscription_administrator    = false
      send_to_subscription_co_administrator = false
      custom_emails                         = ["vivekanand.koppula@mewurk.com"]
    }
  }
  ################################################################################
  ################################################################################
  #######################  Profile-1: Default Profile  ###########################
  ################################################################################
  ################################################################################    
  # Profile-1: Default Profile 
  profile {
    name = "default"
    capacity {
      default = 1
      minimum = 1
      maximum = 10
    }
    rule {
      ###########  START: Percentage CPU Metric Rules  ###########    
      ## Scale-Out       
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
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
    }

    ## Scale-In     
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

  ################################################################################
  ################################################################################
  ####################  Profile-2: Recurrence Profile  - Week Days ###############
  ################################################################################
  ################################################################################
  ## Major Changes in this Block
  # 1. Capacity Block Values Change - Week Days (Minimum = 4, default = 4, Maximum = 20)
  # 2. Recurrence Block for Week Days
  # Profile-2: Recurrence Profile - Week Days
  profile {
    name = "profile-2-weekdays"
    # Capacity Block     
    capacity {
      default = 4
      minimum = 4
      maximum = 10
    }
    # Recurrence Block for Week Days (5 days)
    recurrence {
      timezone = "India Standard Time"
      days     = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
      hours    = [0]
      minutes  = [0]
    }
    ###########  START: CpuPercentage Metric Rules  ###########    
    ## Scale-Out 
    rule {
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = 1
        cooldown  = "PT1M"
      }
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_service_plan.service_plan.id
        # metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
        # metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        time_grain       = "PT1M"
        statistic        = "Average"
        time_window      = "PT5M"
        time_aggregation = "Average"
        operator         = "GreaterThan"
        threshold        = 90
      }
    }

    ## Scale-In 
    rule {
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = 1
        cooldown  = "PT5M"
      }
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_service_plan.service_plan.id
        # metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        time_grain       = "PT1M"
        statistic        = "Average"
        time_window      = "PT5M"
        time_aggregation = "Average"
        operator         = "LessThan"
        threshold        = 10
      }
    }
    ###########  END: Percentage CPU Metric Rules   ###########    

# The follwoing is not a supported metric.
    # ###########  START: Available Memory Bytes Metric Rules  ###########    
    # ## Scale-Out 
    # rule {
    #   scale_action {
    #     direction = "Increase"
    #     type      = "ChangeCount"
    #     value     = 1
    #     cooldown  = "PT5M"
    #   }
    #   metric_trigger {
    #     metric_name = "Available Memory Bytes"
    #     # metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
    #     metric_resource_id = azurerm_service_plan.service_plan.id
    #     # metric_namespace   = "microsoft.compute/virtualmachinescalesets"
    #     time_grain       = "PT1M"
    #     statistic        = "Average"
    #     time_window      = "PT5M"
    #     time_aggregation = "Average"
    #     operator         = "LessThan"
    #     threshold        = 1073741824 # Increase 1 VM when Memory In Bytes is less than 1GB
    #   }
    # }

    # ## Scale-In 
    # rule {
    #   scale_action {
    #     direction = "Decrease"
    #     type      = "ChangeCount"
    #     value     = 1
    #     cooldown  = "PT5M"
    #   }
    #   metric_trigger {
    #     metric_name        = "Available Memory Bytes"
    #     metric_resource_id = azurerm_service_plan.service_plan.id
    #     # metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
    #     metric_namespace = "microsoft.compute/virtualmachinescalesets"
    #     time_grain       = "PT1M"
    #     statistic        = "Average"
    #     time_window      = "PT5M"
    #     time_aggregation = "Average"
    #     operator         = "GreaterThan"
    #     threshold        = 2147483648 # Decrease 1 VM when Memory In Bytes is Greater than 2GB
    #   }
    # }
    ###########  END: Available Memory Bytes Metric Rules  ###########  
  } # End of Profile-2

}