
resource "aws_security_group" "acessos_master" {
  name        = "k8s-acessos_master"
  description = "acessos inbound traffic"
  vpc_id = "${data.aws_vpc.selected.id}" 
  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["${data.aws_vpc.selected.cidr_block}"]
      ipv6_cidr_blocks = null,
      prefix_list_ids = null,
      security_groups: null,
      self: null
    },
    
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = [],
      prefix_list_ids = null,
      security_groups: null,
      self: null,
      description: "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "Ronaldo_sg_K8_master"
  }
}


resource "aws_security_group" "acessos_master_2" {
  name        = "k8s-acessos_master_2"
  description = "acessos inbound traffic"
  vpc_id = "${data.aws_vpc.selected.id}"    
  
  ingress = [
    {
      cidr_blocks      = null,
      description      = "Libera acesso k8s_workers"
      from_port        = 0
      ipv6_cidr_blocks = null,
      prefix_list_ids  = null,
      protocol         = "-1"
      security_groups  = [
        aws_security_group.acessos.id,
      ]
      self             = true
      to_port          = 0
    }
  ]
}
resource "aws_security_group" "acessos" {
  name        = "k8s-workers"
  description = "acessos inbound traffic"
  vpc_id = "${data.aws_vpc.selected.id}"

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["${data.aws_vpc.selected.cidr_block}"]
      ipv6_cidr_blocks = null,
      prefix_list_ids = null,
      security_groups: null,
      self: null
    },
    {
      cidr_blocks      = []
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = null,
      prefix_list_ids  = null,
      protocol         = "-1"
      security_groups  = [
        aws_security_group.acessos_master.id,
      ]
      self             = false
      to_port          = 0
    }
 
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null,
      prefix_list_ids = null,
      security_groups: null,
      self: null,
      description: "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "Ronaldo_sg_K8_workers"
  }
}