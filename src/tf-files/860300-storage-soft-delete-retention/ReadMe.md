# Soft Deletion and Retention

- Execute Plan and Apply the config.

- Note the following in the azurerm_storage_account resource.

```
blob_properties {
  delete_retention_policy {
    days = 365
  }
  container_delete_retention_policy {
    days = 7
  }
}
```

- Now take a look at the images.

![Soft Delete](./images/1SoftDelete1.jpg)

- Now delete the blob.

![Soft Delete](./images/1SoftDelete2.jpg)

- Now verify.

![Soft Delete](./images/1SoftDelete3.jpg)

![Soft Delete](./images/1SoftDelete4.jpg)

- Now if you want to undelete, or restore.

![Soft Delete](./images/1SoftDelete5.jpg)

![Soft Delete](./images/1SoftDelete6.jpg)

![Soft Delete](./images/1SoftDelete7.jpg)


