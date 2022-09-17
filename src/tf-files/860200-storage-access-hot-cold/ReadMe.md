

- Whent access_tier is set to "Archive" for azurerm_storage_blob.static_files_html, I am getting this error. Not sure why

- So what we need to do is first set access_tier = "Cool"(or Hot), then plan, apply. Once successifully deployed, then change access_tier = "Archive". Then again plan and then apply again. This way we can make the blob Archive in two steps.

```
azurerm_role_assignment.storage_acc_role: Creation complete after 32s [id=/subscriptions/10868091-0196-44e3-a0b8-8dee05259147/resourceGroups/vivek-my-rg/providers/Microsoft.Storage/storageAccounts/staticwebsitensjqfb/providers/Microsoft.Authorization/roleAssignments/c9227d73-7188-e825-2589-76f8a7b5b496]
╷
│ Error: updating Properties for Blob "blob1.txt" (Container "content" / Account "staticwebsitensjqfb"): blobs.Client#SetProperties: Failure sending request: StatusCode=409 -- Original Error: Error occurred unmarshalling JSON - Error = 'invalid character '<' looking for beginning of value' JSON = '<?xml version="1.0" encoding="utf-8"?><Error><Code>BlobArchived</Code><Message>This operation is not permitted on an archived blob.
│ RequestId:460a166d-f01e-0077-2065-ca9799000000
│ Time:2022-09-17T07:15:18.5225365Z</Message></Error>'
│
│   with azurerm_storage_blob.static_files_html["blob1.txt"],
│   on tf6-storage-account.tf line 23, in resource "azurerm_storage_blob" "static_files_html":
│   23: resource "azurerm_storage_blob" "static_files_html" {│
```

- Some notes
  - Hot(default), cold and then there is Archive. Archive can be applied only to blob level and not to Storag Account level.
  - Cold(30) and Archive(180). 
  - When you want to pull back any file from Archive, there is what is called as Dehydration. This can take several hours of time.
  - So when any file put into Archive, that file cannot be accessed imediately. 