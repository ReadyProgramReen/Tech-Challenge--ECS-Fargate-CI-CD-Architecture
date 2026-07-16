output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "nat_gateway_ids" {
  description = "IDs of the NAT Gateways"
  value       = aws_nat_gateway.main[*].id
}

# ECR OUTPUTS
output "ecr_frontend_repo_url" {
  value = aws_ecr_repository.frontend.repository_url
}

output "ecr_backend_repo_url" {
  value = aws_ecr_repository.backend.repository_url
}

# ALB OUTPUT
output "frontend_alb_dns" {
  value = aws_lb.frontend.dns_name
}

output "backend_alb_dns" {
  value = aws_lb.backend.dns_name
}