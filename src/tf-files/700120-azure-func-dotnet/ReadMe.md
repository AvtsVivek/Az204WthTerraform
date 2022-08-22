
- This creates azure function with terraform 

- This builds from the earlier exmaple, but the following settings differe.

```terraform

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"       = "",
    "FUNCTIONS_WORKER_RUNTIME"       = "dotnet"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.application_insights.instrumentation_key,
    FUNCTIONS_EXTENSION_VERSION    = "~4"
  }

  site_config {
    application_stack {
      dotnet_version = 6.0
    }
  }

```
  
- The we will create a dotnet based Azure Function in the /src/dotnet-apps folder 0080-AzureFuncVs2022 
  
- The app in 0080-AzureFuncVs2022 is created using VS 2022

- This app is deployed to azure function using vs code. 
