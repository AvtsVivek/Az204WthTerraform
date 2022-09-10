- This demonistrates deployment slots. 

- This builds on earlier example, but without autoscaling. All autoscaling code(tf7-03-app-auto-scaling-default-recurrence-fixed.tf) is commented out.

- If you want, you can include that as well. Just uncomment out the 

- Deployment Slots
![Custom Domain](./images/DeploymentSlots.jpg)

- Take a look at the deployment slots.
![Custom Domain](./images/DeploymentSlots2.jpg)

- Ensure that the connection string is present in the newly created deployment slot as well.
![Custom Domain](./images/DeploymentSlots3.jpg)

- Do some changes to the app(basically some different version) and then deploy to the slot(not to the app)
![Custom Domain](./images/DeploymentSlots4.jpg)

- If you want to swap do the following.
![Custom Domain](./images/DeploymentSlots5.jpg)

- Both web site versions side by side.
![Custom Domain](./images/DeploymentSlots6.jpg)