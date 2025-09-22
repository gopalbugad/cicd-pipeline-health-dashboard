module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  name        = var.name
  subnet_cidr = "10.0.1.0/24"
  tags = {
    Name = var.name
  }
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  name   = var.name
}

module "ec2" {
  source           = "./modules/ec2"
  instance_type    = var.ec2_instance_type
  ami_id           = var.ec2_ami
  key_name         = var.ec2_key_name
  vpc_security_ids = [module.security_group.sg_id]
  subnet_id        = module.vpc.public_subnet_id
  user_data_file   = "${path.module}/user_data.sh"
  name             = var.name
}
