
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
    # repoUrl="https://github.com/alashro/webapp";
    # If you use the following https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/dotnet-apps/0020-simple-webapp
    # Then you get the following error.
    # operation failed with Admin access is required for repository
    # repoUrl="https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/dotnet-apps/0020-simple-webapp";

    # If you use the following https://github.com/AvtsVivek/SimpleNet6WebApp
    # Then you get the following error.
    # Set-AzResource: C:\Vivek\Trials\Tf\Az204\src\tf-files\850100-tools-powershell\Script2.ps1:31:1
    # Line |
    #   31 |  Set-AzResource -ResourceGroupName $ResourceGroupName `
    #      |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    #      | The operation failed because resource is in the: 'Failed' state. Please check the logs for more details.

    # I did not go deep into why this is happening. Leaving now.

    # So use 
    repoUrl="https://github.com/alashro/webapp";
    # repoUrl="https://github.com/AvtsVivek/SimpleNet6WebApp";
    branch="master";
    isManualIntegration="true";
}

Set-AzResource -ResourceGroupName $ResourceGroupName `
-Properties $Properties -ResourceType Microsoft.Web/sites/sourcecontrols `
-ResourceName $WebAppName/web -ApiVersion 2015-08-01 -Force
