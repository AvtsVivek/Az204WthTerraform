cd ../../..

# cd into the directory.
cd ./src/tf-files/650501-sql-db-with-tf/

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan

# terraform show main.tfplan

terraform apply main.tfplan 

terraform state list


terraform plan -destroy -out main.destroy.tfplan


terraform apply main.destroy.tfplan

