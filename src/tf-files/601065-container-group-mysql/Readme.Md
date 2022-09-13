# Deploys Azure container instance with ms sql container

- Deploys using terraform azurerm_container_group

- Once deployed, use sa as user name and then the password would come from below. See the azurerm_container_group

```
  environment_variables = { "ACCEPT_EULA" = "Y", "SA_PASSWORD" = "H@Sh1CoR3!" }
```

- 



