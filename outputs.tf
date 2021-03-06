output "service_name" {
  description = "ECS Service name"
  value       = aws_ecs_service.default.name
}

output "service_role_arn" {
  description = "ECS Service role ARN"
  value       = aws_iam_role.ecs_service.arn
}

output "task_role_arn" {
  description = "ECS Task role ARN"
  value       = aws_iam_role.ecs_task.arn
}

output "exec_role_arn" {
  description = "ECS Exec role ARN"
  value       = aws_iam_role.ecs_exec.arn
}

output "exec_role_name" {
  description = "ECS Exec role name"
  value       = aws_iam_role.ecs_exec.name
}

output "service_security_group_id" {
  description = "Security Group ID of the ECS task"
  value       = aws_security_group.ecs_service.id
}

