cd ../../..

cd ./src/tf-files/400250-app-regist-service-principal-cli

# First get the subscription id. Then paste it in the scopes parameter below command.
az ad sp create-for-rbac --role="Contributor" --name app-reg-service-principal-cli --scopes="/subscriptions/10868091-0196-44e3-a0b8-8dee05259147"

enterprize-app-service-principal-cli

enterprize-app-service-principal-portal



