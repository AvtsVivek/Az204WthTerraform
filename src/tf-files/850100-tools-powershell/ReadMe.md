# This demos creation of resources using powershell. 

- Need to install extensions. See the images. 1extensions1.jpg and so on.
  
- Click the Run button. See 2RunPowerShell1.jpg

- You can run scripts one after the other.

- You may get the following error.

```
    If you use the following https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/dotnet-apps/0020-simple-webapp
    Then you get the following error.
    operation failed with Admin access is required for repository
    repoUrl="https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/dotnet-apps/0020-simple-webapp";

    If you use the following https://github.com/AvtsVivek/SimpleNet6WebApp
    Then you get the following error.
    Set-AzResource: C:\Vivek\Trials\Tf\Az204\src\tf-files\850100-tools-powershell\Script2.ps1:31:1
    Line |
      31 |  Set-AzResource -ResourceGroupName $ResourceGroupName `
         |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         | The operation failed because resource is in the: 'Failed' state. Please check the logs for more details.
```
