## 🚀 Deploying Terraform AWS EC2 + VPC + SG

This document explains how to deploy the Terraform code that provisions:

- A **VPC** (with one public subnet)  
- A **Security Group**  
- An **EC2 Instance** (Amazon Linux 2 with Docker & Git installed via `user_data.sh`)  

---

## **1. Prerequisites**

- Installed:
  - [Terraform](https://developer.hashicorp.com/terraform/downloads)
  - AWS CLI (`aws configure` must be set with valid credentials)  
- An existing **AWS Key Pair** in the target region  
- An **Amazon Linux 2 AMI ID** (use `aws ec2 describe-images` or AWS Console to find one)  
- An **S3 bucket** for Terraform remote state (create one if not available)

---

## **2. File Structure**

```
terraform-aws-ec2/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── backend.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── security_group/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── user_data.sh
```

---

## **3. Configure Backend**

Edit `backend.tf` and update your **S3 bucket** and **key**:

```hcl
terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "ec2-demo/terraform.tfstate"
    region = "us-east-1"
  }
}
```

---

## **4. Update Variables**

Edit `terraform.tfvars` with your details:

```hcl
aws_region        = "us-east-1"
vpc_cidr          = "10.0.0.0/16"
ec2_instance_type = "t2.small"
ec2_ami           = "ami-0abcdef1234567890"   # Replace with valid AMI ID
ec2_key_name      = "my-keypair"              # Replace with your AWS Key Pair
name              = "TerraformDemo"
sg_ingress        = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
```

---

## **5. Initialize Terraform**

```sh
terraform init
```

This will:
- Download the AWS provider  
- Configure the remote backend (S3)  

---

## **6. Validate Configuration**

```sh
terraform validate
```

---

## **7. See the Execution Plan**

```sh
terraform plan
```

---

## **8. Deploy Infrastructure**

```sh
terraform apply -auto-approve
```

This will create:
- VPC + Subnet  
- Security Group  
- EC2 Instance (with Docker & Git installed)  

---

## **9. Get Outputs**

After apply, Terraform will output:

- EC2 Instance ID  
- EC2 Public IP  

You can also check:

```sh
terraform output
```

---

## **10. Destroy Infrastructure (Optional)**

When done, clean up:

```sh
terraform destroy -auto-approve
```

---

✅ You now have a modular, reusable Terraform setup to launch EC2 in a custom VPC with Docker + Git installed automatically.
