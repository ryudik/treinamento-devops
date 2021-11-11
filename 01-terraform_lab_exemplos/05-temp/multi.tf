provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {
  count = 3
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
    Name = "Ronaldo_EC2_multi${count.index}_0"
  }
  vpc_security_group_ids = ["sg-08cb1085001b0aa51"]
 
}
output "instance_ip_addr" {
  value = [
  for item in aws_instance.web :  
   "${item.public_dns} - ${item.public_ip} - ${item.private_ip}"  
  #"ssh -i /Users/ronal/.ssh/acesso.pv ubuntu@${aws_instance.web[0].public_ip}"
  ]
  description = "Mostra os IPs publicos e privados da maquina criada."
  
}