cd ../../..

# cd into the directory.
cd ./src/tf-files/650500-sql-db-with-tf/


terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

terraform show main.tfplan

terraform apply main.tfplan 

terraform state list

# To create diagram, run the following command.
code . -r 

terraform state show 

terraform show terraform.tfstate

terraform plan -destroy -out main.destroy.tfplan

terraform show main.destroy.tfplan

terraform apply main.destroy.tfplan
