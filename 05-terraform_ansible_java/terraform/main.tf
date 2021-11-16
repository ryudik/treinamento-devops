provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  ami           = "ami-0e66f5495b4efdd0f"
  instance_type = "t2.small"
  subnet_id     = "subnet-0af90638faf332140"
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 20
  }
  key_name = "Ronaldo_Keypair" # Nome da Key gerada pelo ssk-keygem e upada na AWS
  tags = {
    Name = "Ronaldo_Ec2_Spring",
    Itau = true
  }
  vpc_security_group_ids = ["sg-08cb1085001b0aa51"]
}
