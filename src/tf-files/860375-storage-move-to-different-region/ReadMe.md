# Moving of Storage Account from one region to another.

- [Reference](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-move?tabs=azure-portal)

- The following are the steps in the above article.
- Export a template.
- Modify the template by adding the target region and storage account name.
- Deploy the template to create the new storage account.
- Configure the new storage account.
- Move data to the new storage account.
- Delete the resources in the source region.

- We are using here terraform, so "Modify the template" means for us the terraform config files, and not ARM templates.