
resource "aws_security_group" "mysql" {
  name        = "ronaldo_pv_mysql"
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
      description      = "Mysql from subnet"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = ["${var.private_subnets}"]
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
    Name = "Ronaldo_sg_mysqlpv"
  }
}
