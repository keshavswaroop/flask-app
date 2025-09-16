variable "key_name" {
  type = string
  description = "Key Name"
  default = "flask-key"
}

variable "default_vpc_name" {
  type = string
  description = "Default VPC"
  default = "flask-vpc"
}

variable "ami_id" {
  type = string
  description = "AMI ID"
  default = "ami-0a716d3f3b16d290c"
}

variable "instance_type" {
  type = string
  description = "Instance Type"
  default = "t3.micro"
}

variable "instance_name" {
  type = string
  description = "Instance Name"
  default = "flask_instance"
}

variable "volume_size" {
  type = number
  description = "Volume Size"
  default = 8
}

variable "volume_type" {
  type = string
  description = "Volume Type"
  default = "gp3"
}

variable "security_group_name" {
  type = string
  description = "Security Group Name"
  default = "flask_sg"
}