Sql Server and Sql Database

- Creates a Sql Server and Sql Database

- Visual Studio 2022 Deployment is not woring. So you can use Vs Code.

- Builds on from the provious exericse and adds logging to the previouos exercise. 

- First add the required extensiions
![Vs code Extension](./Images/VsCodeExtensions.jpg)

- Now deploy
![Vs code Extension](./Images/DeployWithVsCodeExtensions.jpg)

- With tf config files configured for logs(tf7-02-win-web-app, see blow), ensure the logs are configured in the final config.
  - See images AppServiceLogs.jpg, LogStream1, 2, and 3.jpg files

```
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
```

- To produce logs, you have to browse the app, like privacy, home etc. But note that the browser can do caching and so an actual request may not go the server, and so you may not see the logs actually. So ensure you use a new browser, or remove the cacheing.