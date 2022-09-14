
<#
Command Reference

1. Set-AzResource
https://docs.microsoft.com/en-us/powershell/module/az.resources/set-azresource?view=azps-7.3.0

#>

# We are deploying an application from GitHub onto an existing Web App
# Ensure to use your own GitHub repository URL

# Connect-AzAccount

$ResourceGroupName="powershell-grp"
$WebAppName="compapp1122334455"


$Properties =@{
    repoUrl="https://github.com/alashro/webapp";
    branch="master";
    isManualIntegration="true";
}

Set-AzResource -ResourceGroupName $ResourceGroupName `
-Properties $Properties -ResourceType Microsoft.Web/sites/sourcecontrols `
-ResourceName $WebAppName/web -ApiVersion 2015-08-01 -Force
