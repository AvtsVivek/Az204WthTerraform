cd ../../..

cd ./src/tf-files/860400-storage-change-feed

terraform fmt

terraform init

terraform validate

terraform plan -out main.tfplan 

# terraform show main.tfplan

terraform apply main.tfplan

terraform state list

# Once deployed, then create a shared access signature.

# First create the shared access signature

# https://staticwebsitexakcwn.blob.core.windows.net/?sv=2021-06-08&ss=b&srt=sco&sp=rwlac&se=2022-09-19T15:47:13Z&st=2022-09-19T07:47:13Z&spr=https&sig=a96XVyJJb%2BS4K%2FRk8CGkx1ebPY4sGhgPqngJ76s14IQ%3D

# 1. Update the following $storageaccountname with the Storage Container name. See the image 2SharedAccessSignature1.jpg
# 2. Update the following with the sas token $sastoken variable. See the image 2SharedAccessSignature3.jpg

$storageaccountname = "staticwebsitexakcwn"
$sastoken = "?sv=2021-06-08&ss=b&srt=sco&sp=rwlaciy&se=2022-09-20T11:54:38Z&st=2022-09-20T03:54:38Z&spr=https&sig=biaoJ%2BrMfZbOyrWbAHn3ObVDst0gUXXloVTJUFFSAGU%3D"
$containername = "container1"
$baseurl = "https://" + $storageaccountname + ".blob.core.windows.net/" + $containername
$createcontainerurl = $baseurl + $sastoken
$createcontainerurl
$filetoupload = "data.sql"
$uploadbloburl = $baseurl + "/" + $filetoupload + $sastoken
$uploadbloburl

$downloadfilename = "data1.sql"

# Cd into the azcopy folder.

cd C:\Vivek\Software\AzCopy

dir

# To create a container
./azcopy make $createcontainerurl

# To upload a file
# Ensure that the $filetoupload(in this case the data.sql) is avaialbe to the command.
# Else you will get file not found error in the following format.
# The system cannot find the file specified..
./azcopy copy $filetoupload $uploadbloburl

# Download the file.
./azcopy copy $uploadbloburl $downloadfilename

# Once you download the file, you should see it in the folder. See the image 


# For the following command to work, you need to pass on the resource, or data source.
# This resource or data source is got from terraform state list command
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

