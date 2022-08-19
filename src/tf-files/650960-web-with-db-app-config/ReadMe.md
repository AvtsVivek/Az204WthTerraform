- This demonistrates deployment Azure app configuration. 

- This builds on earlier example, but without autoscaling and also without deployment scaling. All autoscaling code(tf7-03-app-auto-scaling-default-recurrence-fixed.tf) is commented out.

- The dependency sequence is arranged as follows. This is working.

1. data.azurerm_client_config.test
2. azurerm_role_assignment.test
3. azurerm_app_configuration.appconf
4. azurerm_app_configuration_key.sql_connection
5. azurerm_mssql_server.mssql_server
6. database
7. web app service plan
8. web app.


But instead, if we arrange the dependencies in such a way that azurerm_app_configuration.appconf and azurerm_app_configuration_key. sql_connection are created in the end, after sql and web app, then I am getting errors. So the above is what is working.


Need to do this.
https://www.mcbeev.com/how-to-add-azure-app-configuration-and-feature-flags-into-blazor-in-net-5

https://csharp.christiannagel.com/2020/05/19/azureappconfiguration/

https://github.com/ProfessionalCSharp/MoreSamples/tree/main/Azure/AzureAppConfigSample/WebAppWithAzureConfig


