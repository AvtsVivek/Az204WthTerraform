cd ../../..

cd ./src/tf-files/870150-cosmos

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

terraform state list

# Add items to the container. See the images.

# Once the items are added, we can query.

# The following queries can be executed.
SELECT g.category FROM Groceries g 
WHERE g.category = "Fruits"

SELECT g.groceryId, g.ItemName, g.category, g.quantity, g.id 
FROM Groceries g 
WHERE g.category = "Fruits"

SELECT SUM(g.quantity)  
FROM Groceries g 
WHERE g.category = "Fruits"

SELECT SUM(g.quantity) AS TotalQuantity 
FROM Groceries g 

SELECT g.category, SUM(g.quantity) AS TotalQuantity 
FROM Groceries g 
GROUP BY g.category

# Now to try something else, delete the records

SELECT g.groceryId, g.ItemName, g.category, g.quantity, g.id, g.source.sourceId, g.source.address
FROM Groceries g 
WHERE g.category = "Fruits"

# You can now update the 

terraform state show 

terraform show terraform.tfstate

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

