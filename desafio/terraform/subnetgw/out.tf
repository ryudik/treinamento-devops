
output "subnet_private" {
  value = [
    "subnet_id      = ${aws_subnet.private.id}"
  ]
}

