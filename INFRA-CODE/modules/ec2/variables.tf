variable "instance_type" { 
    type = string 
}
variable "ami_id" { 
    type = string 
}
variable "key_name" { 
    type = string 
}
variable "subnet_id" { 
    type = string 
}
variable "vpc_security_ids" { 
    type = list(string) 
}
variable "user_data_file" { 
    type = string 
}
variable "name" { 
    type = string 
}
