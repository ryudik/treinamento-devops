provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {
  ami           = "${var.ami_input}"
  instance_type = "${var.instance_input}"
  subnet_id     = "${var.subnet_input}"
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  key_name = "Ronaldo_Keypair" # Nome da Key gerada pelo ssk-keygem e upada na AWS
  tags = {
    Name = "Ronaldo_EC2_var"
  }
  vpc_security_group_ids = ["${var.sg_input}"]
 
}

variable "ami_input" {
  type        = string
  description = "AMI ID AWS"

  validation {
    condition     = length(var.ami_input) > 4 && substr(var.ami_input, 0, 4) == "ami-"
    error_message = "O valor do image_id não é válido, tem que começar com \"ami-\"."
  }
}

variable "instance_input" {
  type        = string
  description = "Instance AWS"

  validation {
    condition     = length(var.instance_input) > 4 && substr(var.instance_input, 0, 3) == "t2."
    error_message = "O valor da instance não é válido, tem que começar com \"t2.\"."
  }
}

variable "subnet_input" {
  type        = string
  description = "Subnet AWS"

  validation {
    condition     = length(var.subnet_input) > 6 && substr(var.subnet_input, 0, 6) == "subnet"
    error_message = "O valor da subnet não é válido, tem que começar com \"subnet\"."
  }
}
variable "sg_input" {
  type        = string
  description = "Security Group AWS"

  validation {
    condition     = length(var.sg_input) > 6 && substr(var.sg_input, 0, 2) == "sg"
    error_message = "O valor do security group não é válido, tem que começar com \"sg\"."
  }
}
#output "instance_ip_addr" {
#  value = [
#  for item in aws_instance.web :  
#   "${item.public_dns} - ${item.public_ip} - ${item.private_ip}"  
#  #"ssh -i /Users/ronal/.ssh/acesso.pv ubuntu@${aws_instance.web[0].public_ip}"
#  ]
#  description = "Mostra os IPs publicos e privados da maquina criada."
  
#}