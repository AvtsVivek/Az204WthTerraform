# Trying the [example in this one](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/app_role_assignment).

- Ensure the config files are successifully applied.
  
- Review the created app registrations. 

![Review](./images/20AfterTerraformConfigFilesDeployment1.jpg)

![Review](./images/20AfterTerraformConfigFilesDeployment2.jpg)

![Review](./images/20AfterTerraformConfigFilesDeployment3.jpg)

![Review](./images/20AfterTerraformConfigFilesDeployment4.jpg)

- Get the required creds to send a POST request to get the token as follows.

![Get Required Info](./images/20AfterTerraformConfigFilesDeployment10.jpg)

![Get Required Info](./images/20AfterTerraformConfigFilesDeployment12.jpg)

![Get Required Info](./images/20AfterTerraformConfigFilesDeployment20.jpg)

- Install [vs code rest client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) and send a POST requet as follows.

```
POST https://login.microsoftonline.com/35b02984-c026-40c5-8cb3-2267c184d48a/oauth2/v2.0/token HTTP/1.1
Content-Type: application/x-www-form-urlencoded
Authorization: Basic trusted:secret

grant_type=client_credentials
&scope=https://graph.microsoft.com/.default
&client_id=e7f0a65e-d4b8-499f-96c9-d92e3df41e14
&client_secret=JUx8Q~xiMv2hb9OVKz8xtc.cCHvqBvcqpH4sKb4K
```

- So the request has gone to Ms, then ms redirected to our tenant, then to AD, then to the application object, the object has given you an access token. 

- Now send a get request.

```
GET https://graph.microsoft.com/v1.0/users HTTP/1.1
Authorization: Bearer Paste_the_full_long_token_that_your_revieved_in_the_previous_post_request_step
```

See all of the images.

