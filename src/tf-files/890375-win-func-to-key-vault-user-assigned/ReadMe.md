- This builds on the previous example. It adds sql db, and the api fetches the data from it.

# Currently this is not working.

- Reference: 
  - https://github.com/Azure/azure-sdk-for-net/blob/main/sdk/identity/Azure.Identity/TROUBLESHOOTING.md#azure-app-service-and-azure-functions-managed-identity

  - https://github.com/Azure/Azure-Functions/issues/2100

- Created a simplier example to demo the problem. The example is **890305-win-app-to-key-vault-user-assigned**

```
ManagedIdentityCredential authentication failed: Service request failed.
Status: 400 (Bad Request)
```

![Error](./images/30Error20.jpg)

- In order to use a user assigned identity with the DefaultAzureCredential you must
- specify the client id of the user assigned identity.
- You can do this either by passing it in code via
- DefaultAzureCredentialOptions.ManagedIdentityClientId like so:
- var tokenCredential = new DefaultAzureCredential(new DefaultAzureCredentialOptions { ManagedIdentityClientId = "bc783ad4-77a7-4d5d-9151-8e9aad5d9fec" });
- Alternatively you can also specify the client id to be used via the AZURE_CLIENT_ID environment variable.
- https://github.com/Azure/azure-sdk-for-net/issues/13564#issuecomment-660431926
- https://github.com/Azure/azure-sdk-for-net/issues/11400#issuecomment-620179175
- For our case, we will be setting env var AZURE_CLIENT_ID in the terraform config file.
 
```tf
app_settings = {
  "AZURE_CLIENT_ID" = azurerm_user_assigned_identity.appag_umid.client_id
}
```

