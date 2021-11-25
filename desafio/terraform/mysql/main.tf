provider "aws" {
  region = "sa-east-1"
}

locals {
  subs = concat([aws_subnet.wes_sub_tf_public_0.id], [aws_subnet.wes_sub_tf_public_1.id], [aws_subnet.wes_sub_tf_public_2.id])
}


resource "aws_instance" "mysql_pv" {
  ami           = "ami-0e66f5495b4efdd0f"
  instance_type = "t3.small"
  subnet_id                   = element(local.subs, count.index)
  count                       = 1
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
