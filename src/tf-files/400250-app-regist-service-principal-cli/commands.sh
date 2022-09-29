cd ../../..

cd ./src/tf-files/400250-app-regist-service-principal-cli

# First get the subscription id. Then paste it in the scopes parameter below command.
az ad sp create-for-rbac --role="Contributor" --name app-reg-service-principal-cli --scopes="/subscriptions/10868091-0196-44e3-a0b8-8dee05259147"

# enterprize-app-service-principal-cli

# To delete

az ad sp delete --id 202c2005-0cb5-4d30-a2c4-5d7f5a0b20c2

# Looks like, deleting the sp using the cli, is deleting the sp, but not the application. You can see that in the porta.
# Once you execute the command, look at the enterprise application, you will see that the sp is deleted. 
# But when you see the app registrations, you will still see that the app is present. It has to be deleted manully from portal.
# 



