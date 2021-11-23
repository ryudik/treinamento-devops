variable "vpc_name" {
  type = string
  default = "Ronaldo_VPC_03"
  description = "VPC Sandbox"
}
variable "private_subnets" {
  type = string
  default     =  "192.168.15.0/24"
}

variable "azs" {
  type = string
  default     = "sa-east-1a"
}

variable "pvsubid" {
  type = string
  default     =  "subnet-062c5582cd7a36933"
}


