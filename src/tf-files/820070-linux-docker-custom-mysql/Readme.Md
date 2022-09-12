# Create a VM with a network security group

- This builds [on this](https://github.com/AvtsVivek/Az204WthTerraform/tree/main/src/tf-files/601010-linux-docker-nginx)

- Deploys a linux VM, then provisions docker, then starts a docker nginx container and also mysql container.

- A custom mysql image is created which will hold some data. This exercise includes a folder called custom-docker-image-files, and this folder includes a Dockerfile and an sql script. 
  
- This Dockerfile is used to create a new image on the vm(not on the local machine).
  
- So once the vm is deployed, the provisioning begins. As a part of provisioning, the files are transfered to the vm by using file provisioner. The file provisioner is part of the vm resource. 

- Three files are transfered which are 01.sql(mysql script), Dockerfile, and provisionscript.sh
  
- The remote-exec provisioner, is used to provision, and it basically runs the provisionscript.sh file. 

- This is a good example for file provisioner and remote-exec provisioner demonistration.

- In the resource **azurerm_linux_virtual_machine**(or even windows vm for that matter) there is an argument called **custom_data**.
This helps in executing scripts after the deployment of the vm. Either we can use in line scripts or a file which has scripts.
The execution of this script is taken care by terraform.
But the downside of this is, this happens immediately after the deployment.
So if you need to pass on any files to the vm before running any of the scripts,
and you want to use those files in running the scripts, then this is not ideal. 
So lets say we want to copy some files after deployment, say a Dockerfile to create a docker image.
This **custom_data** will not be of help. This is because the file provisioner will run after this custom_data script run.
This scipt executes before any terraform file provisioner is executed.
So for such a scenario, its better to use **remote-exec** provisioner.
So in such a case, we can have file provisioner run to transfer the files, and then the remote-exec provisioner to execute a script transfered script file. And the script may also use some other files which are also transfered by the file provisioner, in our case the Dockerfile and 01.sql(the mysql script) 

- My sql runs on 3306 port, and nginx on default 80.

- Then you can access that page from internet, public IP.

- Bastion subnet, app subnet and db subnet are removed.

- Web Network Security Group can be considered as the first level.

- VM Network Security Group(Optional) can be considered as the second level.

![The layout](./images/Layout.jpg)

- The following is the diagram downloaded from the Azure Portal.

![The Diagram](./images/topology.svg)

- My Sql container
  
![My Sql](./images/MySqlOnContainer.jpg)  

