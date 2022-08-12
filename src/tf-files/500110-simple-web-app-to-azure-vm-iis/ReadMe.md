# Add IIS to your Azure VM

- This builds [on the previous example](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/500100-simple-web-app-to-azure-vm), and adds iis to the VM.

- Everything is working except that the app is not running on IIS. There is some configuration issue with IIS. See the last screen shots. Leaving at this for now.

- Add Azure Account To Vs 2022 
![Web Deploy On Win Server](./Images/AddedAzureAccountToVs2022.jpg)

- Add Publish Profile 
![Add Publish Profile](./Images/AddPublishProfile.jpg)

- Add Publish Profile 
![Add Publish Profile](./Images/AddPublishProfile2.jpg)

- Add Publish Profile 
![Add Publish Profile](./Images/AddPublishProfile3.jpg)

- Add Publish Profile 
![Add Publish Profile](./Images/AddPublishProfile4.jpg)

- Add Publish Profile 
![Add Publish Profile](./Images/AddPublishProfile5_1.jpg)

- If you get an error as shown below, you need to [install web deploy on the developtment machine](https://download.visualstudio.microsoft.com/download/pr/e1828da1-907a-46fe-a3cf-f3b9ea1c485c/035860f3c0d2bab0458e634685648385/webdeploy_amd64_en-us.msi). 

- Add Publish Profile 
![Add Publish Profile](./Images/AddPublishProfile5_2.jpg)

- Add Publish Profile 
![Add Publish Profile](./Images/AddPublishProfile6.jpg)

- Add Publish Profile 
![Add Publish Profile](./Images/AddPublishProfile7.jpg)

- Web Deploy On Win Server 
![Web Deploy On Win Server](./Images/WebDeployOnWinServer.jpg)

- Web Deploy On Win Server 2
![Web Deploy On Win Server](./Images/WebDeployOnWinServer2.jpg)

- Web Deploy On Win Server 3
![Web Deploy On Win Server](./Images/WebDeployOnWinServer3.jpg)

- Stuck at this. Not able to resolve this.
![Web Deploy On Win Server](./Images/WebDeployOnWinServer4.jpg)

- Stuck at this. We are able to see the same from internet.  
![Web Deploy On Win Server](./Images/WebDeployOnWinServer5.jpg)

- Now this is resolved. The problem is with the dotnet hosting bundle installation. It was not getting installed.
  
- Currently this is resolved with sku = "2019-Datacenter". There seems to be some problem with sku = "2022-Datacenter". Its not working.





