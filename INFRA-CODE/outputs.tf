output "instance_public_ip" {
  description = "EC2 public IP (if assigned)"
  value       = module.ec2.public_ip
}
