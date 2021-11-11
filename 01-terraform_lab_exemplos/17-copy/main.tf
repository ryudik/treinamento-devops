provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  #key_name                = "Ronaldo_Keypair" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet.id # vincula a subnet direto e gera o IP automático
  #private_ip              = "172.17.0.100"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]

  tags = {
    Name = "Ronaldo_VPC_Terraform_01"
  }
}


resource "aws_instance" "web1" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  #key_name                = "Ronaldo_Keypair" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet_2.id # vincula a subnet direto e gera o IP automático
  #private_ip              = "172.17.0.100"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]

  tags = {
    Name = "Ronaldo_VPC_Terraform_02"
  }
}

resource "aws_instance" "web2" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  #key_name                = "Ronaldo_Keypair" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet_3.id # vincula a subnet direto e gera o IP automático
  #private_ip              = "172.17.0.100"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]

  tags = {
    Name = "Ronaldo_VPC_Terraform_03"
  }
}

resource "aws_instance" "web3" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  #key_name                = "Ronaldo_Keypair" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet_3.id # vincula a subnet direto e gera o IP automático
  #private_ip              = "172.17.0.100"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]

  tags = {
    Name = "Ronaldo_VPC_Terraform_04"
  }
}
#resource "aws_eip" "example" {
#  vpc = true
#}


#resource "aws_eip_association" "eip_assoc" {
#  instance_id   = aws_instance.web.id
#  allocation_id = aws_eip.example.id
#}

# terraform refresh para mostrar o ssh

output "aws_instance_e_ssh" {
  value = [
    aws_instance.web.public_ip,
    "ssh -i ~/Desktop/devops/treinamentoItau ubuntu@${aws_instance.web.public_dns}"
  ]
}