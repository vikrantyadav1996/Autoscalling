output "autoscaling_group_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.linux.name
}

output "launch_template_id" {
  description = "The ID of the Launch Template"
  value       = aws_launch_template.linux.id
}

# Query instances by the Auto Scaling Group name tag
data "aws_instances" "linux_instances" {
  filter {
    name   = "tag:aws:autoscaling:groupName"
    values = [aws_autoscaling_group.linux.name]
  }
}

output "autoscaling_group_instance_ids" {
  description = "The instance IDs managed by the Auto Scaling Group"
  value       = data.aws_instances.linux_instances.ids
}

output "cpu_high_alarm_name" {
  description = "The name of the CloudWatch Alarm for high CPU utilization"
  value       = aws_cloudwatch_metric_alarm.cpu_high.alarm_name
}

output "cpu_low_alarm_name" {
  description = "The name of the CloudWatch Alarm for low CPU utilization"
  value       = aws_cloudwatch_metric_alarm.cpu_low.alarm_name
}
