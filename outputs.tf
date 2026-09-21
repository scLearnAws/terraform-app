output "instance_id" {
  description = "Application EC2 instance ID."
  value       = aws_instance.app.id
}

output "instance_public_ip" {
  description = "Public IP assigned to the application instance."
  value       = aws_instance.app.public_ip
}

output "security_group_id" {
  description = "Application-owned security group ID."
  value       = aws_security_group.app.id
}
