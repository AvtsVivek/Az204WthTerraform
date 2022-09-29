# Attempts to do an app registration using Az cli.

- The following is the command to be used.
- 
```ps
az ad sp create-for-rbac --role="Contributor" --name app-reg-service-principal-cli --scopes="/subscriptions/10868091-0196-44e3-a0b8-8dee05259147"
```
- When you create using cli, the app registration is automatically added the ownner as well. See 40AppRegistration50.jpg and 40AppRegistration60.jpg

