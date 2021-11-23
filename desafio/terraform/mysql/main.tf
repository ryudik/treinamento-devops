provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "mysql_pv" {
  ami           = "ami-0e66f5495b4efdd0f"
  instance_type = "t3.small"
  subnet_id     = "${var.pvsubid}"
  root_block_device {
    encrypted = true
    volume_size = 20
  }
  key_name = "Ronaldo_Keypair" # Nome da Key gerada pelo ssk-keygem e upada na AWS
  tags = {
    Name = "Ronaldo_pv_mysql",
    Itau = true
  }
  vpc_security_group_ids = [aws_security_group.mysql.id]
}
