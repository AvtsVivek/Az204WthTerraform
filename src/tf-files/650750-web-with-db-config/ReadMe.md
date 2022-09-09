Sql Server and Sql Database

- Creates a Sql Server and Sql Database

- Visual Studio 2022 Deployment is not woring. So you can use Vs Code.

- First add the required extensiions
![Vs code Extension](./Images/VsCodeExtensions.jpg)

- Now deploy

![Vs code Extension](./Images/DeployWithVsCodeExtensions.jpg)

- This adds a connection string to the app service

```
connection_string {
  name  = "SQLConnection"
  type  = "SQLAzure"
  value = "Server=tcp:hr-dev-viv-ms-sql-server.database.windows.net,1433;Initial Catalog=hr-dev-viv-ms-sql-db;Persist Security Info=False;User ID=adm1n157r470r;Password=4-v3ry-53cr37-p455w0rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}
```

![Connection string to app service](./Images/AppServiceConfig.jpg)

- This adds a connection string to the app service. So in the web app, 0050-ConnectToSqlAppWithConString, the connection string from the appsettingsjsone file is commented out. This is because the app is going to pick from the app service rather than fromt the app settings.

