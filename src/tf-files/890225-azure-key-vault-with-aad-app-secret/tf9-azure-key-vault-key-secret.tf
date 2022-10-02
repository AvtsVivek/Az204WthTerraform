
resource "azurerm_key_vault_secret" "key_vault_secret" {
  name         = "secret-sauce"
  value        = "szechuan"
  key_vault_id = azurerm_key_vault.key_vault.id
}

