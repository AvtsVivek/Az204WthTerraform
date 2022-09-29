namespace = "Dev"
appname   = "enterprize-app-service-principal-terraform"

location                          = "eastus"
resource_group_name               = "vivek-my-rg"
storage_account_name              = "staticwebsite"
storage_account_tier              = "Standard"
storage_account_replication_type  = "LRS"
storage_account_kind              = "StorageV2"
static_website_index_document     = "index.html"
static_website_error_404_document = "error.html"

