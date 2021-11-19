provider "aws" {
  region = "sa-east-1"
}


resource "aws_instance" "k8s_proxy" {
  ami           = "ami-0e66f5495b4efdd0f"
  instance_type = "t3.medium"
  subnet_id     = "${data.aws_subnet.test_subnet.0.id}"
  root_block_device {
    encrypted = true
    volume_size = 20
  }
  key_name = "Ronaldo_Keypair" # Nome da Key gerada pelo ssk-keygem e upada na AWS
  tags = {
    Name = "Ronaldo_k8s_haproxy",
    Itau = true
  }
  vpc_security_group_ids = [aws_security_group.acessos.id]
}

resource "aws_instance" "k8s_masters" {
  ami           = "ami-0e66f5495b4efdd0f"
  instance_type = "t3.medium"
  subnet_id     = "${element(data.aws_subnet.test_subnet.*.id, count.index)}"
  key_name = "Ronaldo_Keypair"
  root_block_device {
    encrypted = true
    volume_size = 20
  }
  count         = 3
  tags = {
    Name = "Ronaldo_k8s_master-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.acessos_master.id,aws_security_group.acessos_master_2.id]
  depends_on = [
    aws_instance.k8s_workers,
  ]
}

resource "aws_instance" "k8s_workers" {
  ami           = "ami-0e66f5495b4efdd0f"
  instance_type = "t3.medium"
  subnet_id     = "${element(data.aws_subnet.test_subnet.*.id, count.index)}"
  key_name = "Ronaldo_Keypair"
  root_block_device {
    encrypted = true
    volume_size = 20
  }
  count         = 3
  tags = {
    Name = "Ronaldo_k8s_workers-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.acessos.id]
}



# terraform refresh para mostrar o ssh
