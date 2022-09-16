# Storage Accounts

- This builds on previous exercise, but enables static website.

- Enabling Static Website creates a container with name $web. 

- Also note that Static Web site has got an end point, index and error page. See screen shots in the images folder.

- Also observe that $web container does not hold any files. 
  - Also the static web site is configured with error page and index page, but there are no such files automatically uploaded.
  - So you see 404 not found at the end point.
- To upload the files we need to do that seperately using a azurerm_storage_blob resource. This we will do in the subsequent exercise.