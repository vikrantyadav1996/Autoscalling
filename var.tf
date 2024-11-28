variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "eu-north-1"  # Default region, can be overridden
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  type        = string
  default = "ami-08eb150f611ca277f"
}

variable "instance_type" {
  description = "The type of EC2 instance"
  default     = "t3.micro"  # Default instance type, can be overridden
}

variable "key_name" {
  description = "The SSH key pair name to access the EC2 instance"
  type        = string
  default = "jenkins"
}

variable "security_group_id" {
  description = "The security group ID to associate with the EC2 instances"
  type        = string
  default = "sg-0522b134313a79b7d"
}

variable "volume_size" {
  description = "The size of the EBS volume for EC2 instances (in GB)"
  default     = 8
}

variable "desired_capacity" {
  description = "The desired number of instances in the Auto Scaling Group"
  default     = 2
}

variable "min_size" {
  description = "The minimum number of instances in the Auto Scaling Group"
  default     = 1
}

variable "max_size" {
  description = "The maximum number of instances in the Auto Scaling Group"
  default     = 5
}

variable "subnet_ids" {
  description = "The list of subnet IDs where EC2 instances will be launched"
  type        = list(string)
  default = [ "subnet-02aefaefd5eb56ca3" ]
}
