- This demonistrates deployment Azure app configuration resource with feature flags

- This is currently not working. Getting the following error.

azurerm_app_configuration.appconf: Creating...
azurerm_app_configuration.appconf: Still creating... [10s elapsed]
╷
│ Error: creating Configuration Store (Subscription: "10868091-0196-44e3-a0b8-8dee05259147"
│ Resource Group Name: "example-resources"
│ Config Store Name: "appConf1"): polling after Create: Code="NameUnavailable" Message="The specified name is already in use." AdditionalInfo=[{"info":{"activityId":"75c7e2e6-2ea7-4f58-9a75-b8f2a5329fda"},"type":"ActivityId"}]
│
│   with azurerm_app_configuration.appconf,
│   on main.tf line 28, in resource "azurerm_app_configuration" "appconf":
│   28: resource "azurerm_app_configuration" "appconf" {
  
- 