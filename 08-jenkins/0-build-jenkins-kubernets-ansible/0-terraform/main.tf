provider "aws" {
  region = "sa-east-1"
}


resource "aws_instance" "jenkins" {
  ami                         = "ami-0e66f5495b4efdd0f"
  instance_type               = "t3.medium"
  subnet_id                   = data.aws_subnet.test_subnet.0.id
  associate_public_ip_address = true
  root_block_device {
    encrypted   = true
    volume_size = 20
  }
  key_name = "Ronaldo_Keypair" # Nome da Key gerada pelo ssk-keygem e upada na AWS
  tags = {
    Name = "Ronaldo_Jenkins",
    Itau = true
  }
  vpc_security_group_ids = ["${aws_security_group.jenkins.id}"]
}

resource "aws_security_group" "jenkins" {
  name        = "acessos_jenkins"
  description = "acessos_jenkins inbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["${data.aws_vpc.selected.cidr_block}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
    {
      description      = "SSH from VPC"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids  = null,
      security_groups : null,
      self : null,
      description : "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "jenkins-lab"
  }
}

# terraform refresh para mostrar o ssh
output "jenkins" {
  value = [
    "jenkins",
    "id: ${aws_instance.jenkins.id}",
    "private: ${aws_instance.jenkins.private_ip}",
    "public: ${aws_instance.jenkins.public_ip}",
    "public_dns: ${aws_instance.jenkins.public_dns}",
    "ssh -i ~/.ssh/acesso.pv ubuntu@${aws_instance.jenkins.public_dns}"
  ]
}
