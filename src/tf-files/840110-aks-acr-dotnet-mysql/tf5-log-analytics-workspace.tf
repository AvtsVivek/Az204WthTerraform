# Create Log Analytics Workspace

# https://github.com/stacksimplify/azure-aks-kubernetes-masterclass/tree/master/24-Azure-AKS-Terraform/24-03-Create-AKS-Cluster#step-05-create-azure-log-analytics-workspace-terraform-resource

# The Azure Monitor for Containers (also known as Container Insights) 
# feature provides performance monitoring for workloads running 
# in the Azure Kubernetes cluster.

resource "azurerm_log_analytics_workspace" "insights" {
  name                = "logs-${random_pet.aksrandom.id}"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  retention_in_days   = 30
}