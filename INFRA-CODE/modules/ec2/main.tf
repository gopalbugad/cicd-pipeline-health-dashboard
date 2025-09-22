resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_ids
  user_data              = file(var.user_data_file)

  tags = {
    Name = var.name
  }
}
