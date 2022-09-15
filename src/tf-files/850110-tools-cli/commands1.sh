# Execute the following in powershell.

$ResourceGroupName="docker-grp"

$ResourceGroupLocation="North Europe"

$AppServicePlanName="companyplan"

$AppName="dockerapp665544"

# 1. Create RG

az group create --name $ResourceGroupName --location $ResourceGroupLocation

az group list

# 2. Second we can create an App service plan

az appservice plan create --name $AppServicePlanName --resource-group $ResourceGroupName --is-linux

# 2. Then we create the web app

az webapp create --resource-group $ResourceGroupName --plan $AppServicePlanName --name $AppName --deployment-container-image-name avts/nginxvivek:v4

# 3. If you want to turn on container logging

az webapp log config --name $AppName --resource-group $ResourceGroupName --docker-container-logging filesystem

# 4. Enable the log stream

az webapp log tail --name $AppName --resource-group $ResourceGroupName

# Finally delete the rg

az group delete --name $ResourceGroupName --yes
