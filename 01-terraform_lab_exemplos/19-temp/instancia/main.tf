terraform {
  required_version = ">= 0.12" # colocando compatibilidade do terraform para 0.12
}

resource "aws_instance" "web" {
  ami           = "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0af90638faf332140"
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  key_name = "Ronaldo_Keypair" # Nome da Key gerada pelo ssk-keygem e upada na AWS
  tags = {
    Name = "${var.nome}",
    Itau = true
  }
  vpc_security_group_ids = ["sg-08cb1085001b0aa51"]
}