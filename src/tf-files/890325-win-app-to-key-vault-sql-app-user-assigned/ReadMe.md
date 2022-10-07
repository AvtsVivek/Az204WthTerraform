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