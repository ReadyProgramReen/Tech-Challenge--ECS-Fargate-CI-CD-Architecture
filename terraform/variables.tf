variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used as a prefix/tag for all resources"
  type        = string
  default     = "tech-challenge-ECS Fargate CI/CD"
}