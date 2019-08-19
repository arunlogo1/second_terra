# second_terra
Terra assignment 

  -> Install AWS CLI in the host machine and configure AWS default profile 
  
  -> Install terraform in the host machine from the path https://www.terraform.io/downloads.html
  
  -> Create a new directory and initialize the Git Repo using "git init"
  
  -> Add the remote repo "git remote add origin https://github.com/arunlogo1/second_terra.git"
  
  -> pull the master repo in your local host using "git pull origin master"
  
  -> Initialize the terraform script using "terraform init" - it will download necessary plugins and modules
  
  -> plan the infrastructure using "terraform plan"
  
  -> Create the infrastructure using "terraform apply"
  
  -> In case, if you would like to delete the created infracture , execute "terraform destroy"
  
  
Key_Pair instruction to establish ssh connection:

  -> create the public key and private key using "ssh-keygen"
  
  -> provide the public key in "aws_key_pair" " in sgdir module 
  
  
  
