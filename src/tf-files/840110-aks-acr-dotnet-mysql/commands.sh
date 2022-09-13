
cd ../../..

# cd into the directory.
# C:\Vivek\Trials\Tf\Az204\src\tf-files\840100-aks-nginx\commands.sh

cd ./src/tf-files/840110-aks-acr-dotnet-mysql

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan

terraform state list

terraform state show 

terraform show terraform.tfstate

############################################################################################

# Review the resources created.
# Ensure Azure Container Registry is created.

cd create-docker-image

docker build -t vivekswkcontainergroupacr.azurecr.io/mysqlwithdata:v1 .

docker image ls

cd ..

# Now time to build the web app image. This web app needs a mysql database.

# cd into the directory.
# Note we are going into that directry which is not where the Dockerfile is present. 
# Its the context location, where .dockerignore file is present.
cd ./../../dotnet-apps/0150-ConnectToMySqlAppWithConString/

docker build -t vivekswkcontainergroupacr.azurecr.io/simplewebappwithmysql:v1 . -f ConnectToMySqlAppWithConString/Dockerfile

docker image ls

cd ./../../../src/tf-files/840110-aks-acr-dotnet-mysql/

az acr login --name vivekswkcontainergroupacr

docker push vivekswkcontainergroupacr.azurecr.io/mysqlwithdata:v1

docker push vivekswkcontainergroupacr.azurecr.io/simplewebappwithmysql:v1

# Now go to the portal, review the repositories of the acr. Two repos must be present.

############################################################################################


# Get the resource group name and AKS_CLUSTER_NAME 
# Default admin
az aks get-credentials --resource-group aks-tf-trial1-rg-dev --name aks-tf-trial1-rg-dev-aks-cluster --admin

az aks get-credentials --resource-group aks-tf-trial1-rg-dev --name aks-tf-trial1-rg-dev-aks-cluster --overwrite-existing --admin

kubectl cluster-info

# If you want to logout or unset, use the following.
# kubectl config unset current-context

kubectl get nodes

az aks show --resource-group aks-tf-trial1-rg-dev --name aks-tf-trial1-rg-dev-aks-cluster

# When asked, use the following creds
# --user-principal-name aksadmin1@vivek7dm1outlook.onmicrosoft.com ^
# --password @AKSDemo123

kubectl cluster-info

az aks nodepool list

# The above gives error, so use the following.

az aks nodepool list --resource-group aks-tf-trial1-rg-dev --cluster-name aks-tf-trial1-rg-dev-aks-cluster -o table

kubectl get pod -o=custom-columns=NODE-NAME:.spec.nodeName,POD-NAME:.metadata.name -n kube-system

# The following should show msi
az aks show --resource-group aks-tf-trial1-rg-dev --name aks-tf-trial1-rg-dev-aks-cluster --query servicePrincipalProfile

# Why is the following giving empity array? Not sure. Need to find out(some times).
# httpapplicationrouting-terraform-aks-dev-aks-cluster
# omsagent-terraform-aks-dev-aks-cluster
# azurepolicy-terraform-aks-dev-aks-cluster
# terraform-aks-dev-aks-cluster-agentpool
az identity list --resource-group aks-tf-trial1-rg-dev
az identity list --resource-group aks-tf-trial1-rg-dev-nrg

# Get pods
kubectl get pods -n kube-system

# If you want to delete a pod
# kubectl delete pod aci-connector-linux-fcd85b789-7q6m2 -n kube-system

# Observe the output. You will see the aci-connector-linux-686f8748cc-7fld5 pod is not able to start.
# So look at the logs. Ensure you have the connect pod name below
kubectl logs -f aci-connector-linux-54fb76ccd-m5xct -n kube-system

kubectl delete pod aci-connector-linux-54fb76ccd-m5xct -n kube-system

kubectl get deployment 

kubectl get deployment -n kube-system

kubectl get svc

kubectl get svc -n kube-system

kubectl get service

kubectl get service -n kube-system

kubectl apply -f .\kube-manifests\01-Webserver-Apps\

kubectl delete -f .\kube-manifests\01-Webserver-Apps\

kubectl get pods

# From the output of the above command, the pod id and put in the following commands.

kubectl logs -f myapp-54d86ff4b9-gx4td

kubectl describe pod myapp-54d86ff4b9-gx4td

kubectl get deployment 

kubectl get deployment -n kube-system

kubectl get svc

kubectl get svc -n kube-system

kubectl get service

kubectl get service -n kube-system

# From the above commands, get the external ip address and browse to it.

terraform plan -destroy -out main.destroy.tfplan

# terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan

Remove-Item -Recurse -Force .terraform/modules

Remove-Item -Recurse -Force .terraform

Remove-Item terraform.tfstate

Remove-Item terraform.tfstate.backup

Remove-Item main.tfplan

Remove-Item main.destroy.tfplan

Remove-Item .terraform.lock.hcl
