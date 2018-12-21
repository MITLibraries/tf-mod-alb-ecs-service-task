Terraform module to provision an ECS service task and ALB target group.
This is currently designed for web apps only (specifically our Fargate containers),
but could potentially be modified for "cron task" containers.

This is originally form [Cloudposse's module] (https://github.com/cloudposse/terraform-aws-ecs-alb-service-task/blob/master/README.md).

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alb\_target\_group\_arn | The ALB target group ARN for the ECS service | string | - | yes |
| container\_definition\_json | The JSON of the task container definition | string | - | yes |
| container\_name | The name of the container in task definition to associate with the load balancer | string | - | yes |
| container\_port | The port on the container to associate with the load balancer | string | `80` | no |
| deployment\_maximum\_percent | The upper limit of the number of tasks (as a percentage of `desired_count`) that can be running in a service during a deployment | string | `200` | no |
| deployment\_minimum\_healthy\_percent | The lower limit (as a percentage of `desired_count`) of the number of tasks that must remain running and healthy in a service during a deployment | string | `100` | no |
| desired\_count | The number of instances of the task definition to place and keep running | string | `1` | no |
| ecs\_cluster\_arn | The ARN of the ECS cluster where service will be provisioned | string | - | yes |
| launch\_type | The launch type on which to run your service. Valid values are EC2 and FARGATE | string | `FARGATE` | no |
| name | Solution name, e.g. 'app' or 'cluster' | string | - | yes |
| network\_mode | The network mode to use for the task. This is required to be awsvpc for FARGATE `launch_type` | string | `awsvpc` | no |
| private\_subnet\_ids | Private subnet IDs | list | - | yes |
| security\_group\_ids | Security group IDs to allow in Service network_configuration | list | - | yes |
| tags | Additional tags (e.g. `map('BusinessUnit`,`XYZ`) | map | `<map>` | no |
| task\_cpu | The number of CPU units used by the task. If using Fargate launch type `task_cpu` must match supported memory values (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size) | string | `256` | no |
| task\_memory | The amount of memory (in MiB) used by the task. If using Fargate launch type `task_memory` must match supported cpu value (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size) | string | `512` | no |
| vpc\_id | The VPC ID where resources are created | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| service\_name | ECS Service name |
| service\_role\_arn | ECS Service role ARN |
| service\_security\_group\_id | Security Group ID of the ECS task |
| task\_role\_arn | ECS Task role ARN |
