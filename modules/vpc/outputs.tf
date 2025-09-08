output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [aws_subnet.main.id, aws_subnet.main2.id, aws_subnet.main3.id]
}

output "security_group_id" {
  value = aws_security_group.allow_tls.id
}