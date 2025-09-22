----------------------------------------------------

# Instructions/Prompts for Terraform Code

----------------------------------------------------


**Example 1 -**

``` As a DevOps Engineer, write a Terraform code for me considering the below points/conditions - 
Ask me questions if required. 

1 - Use the module approach here. 
2 - Write code for AWS services - EC2, SG, and VPC only. 
3 - Make sure to launch this EC2 instance under this VPC only. 
5 - Write user data in a separate .sh file ( FYI - I am using an Amazon Linux 2 image) to install Docker and git and use it in the EC2 resource block. 

IMPORTANT -  

1 - For VPC - You can assume any VPC CIDR range you want. 
2 - For EC2 - Use the t2.small instance type. I will provide a key pair and AMI ID.  
3 - Security Group Ingress ports - I will add it later. 
4 - Configure the remote backend to store the state file in an S3 bucket, and leave the S3 bucket name and path empty for later addition.  
5 - Add the name tag only for all resources. 
6 - Use the terraform.tfvars file to store variable values.

NOTE -   
1 - First, provide the file structure. 
2 - Provide code in separate files only. ```


**Example 2 -**

``` Create the deployment.md file to deploy this Terraform code. ```
