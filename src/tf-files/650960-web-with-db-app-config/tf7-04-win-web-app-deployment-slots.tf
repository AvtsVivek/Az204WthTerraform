
# Web app slots are commented out to keep things simple and on app configuration

/*

resource "azurerm_windows_web_app_slot" "web_app_slot_one" {
  name           = "dev"
  app_service_id = azurerm_windows_web_app.windows_web_app.id

# You can have the connection string to point 
  connection_string {
     name  = "SQLConnection"
    type  = "SQLAzure"
    value = "Server=tcp:hr-dev-ms-sql-server.database.windows.net,1433;Initial Catalog=hr-dev-ms-sql-db;Persist Security Info=False;User ID=adm1n157r470r;Password=4-v3ry-53cr37-p455w0rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"   
  }

  site_config {}
}

*/

# You can have more than one deployment slots. For now we are keeping the second one commented.
# resource "azurerm_windows_web_app_slot" "web_app_slot_two" {
#   name           = "staging"
#   app_service_id = azurerm_windows_web_app.windows_web_app.id

# connection_string {
#    name  = "SQLConnection"
#   type  = "SQLAzure"
#   value = "Server=tcp:hr-dev-ms-sql-server.database.windows.net,1433;Initial Catalog=hr-dev-ms-sql-db;Persist Security Info=False;User ID=adm1n157r470r;Password=4-v3ry-53cr37-p455w0rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"   
# }
#   site_config {}
# }