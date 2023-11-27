output "aws_caller_identity" {
  description = "data.aws_caller_identity.current"
  value       = data.aws_caller_identity.current
}

output "aws_region" {
  description = "data.aws_region.current"
  value       = data.aws_region.current
}

output "google_project" {
  description = "data.google_project.current"
  value       = data.google_project.current
}
