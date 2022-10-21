variable "env" {
  type        = string
  description = "this varaible represents the environment"
  default     = "dev"
}

variable "instance_type" {
  type        = string
  description = "this varaible represents the size of EC2"
  default     = "t2.micro"
}

variable "max_size" {
  type        = number
  description = "this varaible represents the max size of ec2"
  default     = 5
}

variable "min_size" {
  type        = number
  description = "this varaible represents the min size of ec2"
  default     = 2
}

variable "desired_size" {
  type        = number
  description = "this varaible represents the desired size of ec2"
  default     = 2
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "subnet to create ec2 on"
  default     = [ "subnet-01e52e38768cfb1b2", "subnet-0dadacb12c2714c21" ]
}


