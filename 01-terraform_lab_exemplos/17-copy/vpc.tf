resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.123.0/24"
  enable_dns_hostnames = true

  tags = {
    Name = "Ronaldo_TerraformVPCPublicSubnet"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.123.0/26"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Ronaldo-subnettf01"
  }
}


resource "aws_subnet" "my_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.123.64/26"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Ronaldo-subnettf02"
  }
}

resource "aws_subnet" "my_subnet_3" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.123.128/26"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Ronaldo-subnettf03"
  }
}

resource "aws_subnet" "my_subnet_4" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.123.192/26"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Ronaldo-subnettf04"
  }
}
#resource "aws_internet_gateway" "gw" {
#  vpc_id = aws_vpc.my_vpc.id
#
#  tags = {
#    Name = "Ronaldo_internet_gateway_terraform"
#  }
#}

resource "aws_route_table" "rt_terraform" {
  vpc_id = aws_vpc.my_vpc.id

  route = [
 #     {
 #       carrier_gateway_id         = ""
 #       cidr_block                 = "0.0.0.0/0"
 #       destination_prefix_list_id = ""
 #       egress_only_gateway_id     = ""
 #       #gateway_id                 = aws_internet_gateway.gw.id
 #       gateway_id                 = ""
 #       instance_id                = ""
 #       ipv6_cidr_block            = ""
 #       local_gateway_id           = ""
 #       nat_gateway_id             = ""
 #       network_interface_id       = ""
 #       transit_gateway_id         = ""
 #       vpc_endpoint_id            = ""
 #       vpc_peering_connection_id  = ""
 #     }
  ]

  tags = {
    Name = "Ronaldo_rt_terraform"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.rt_terraform.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.my_subnet_2.id
  route_table_id = aws_route_table.rt_terraform.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.my_subnet_3.id
  route_table_id = aws_route_table.rt_terraform.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.my_subnet_4.id
  route_table_id = aws_route_table.rt_terraform.id
}

# resource "aws_network_interface" "my_subnet" {
#   subnet_id           = aws_subnet.my_subnet.id
#   private_ips         = ["172.17.10.100"] # IP definido para instancia
#   # security_groups = ["${aws_security_group.allow_ssh1.id}"]

#   tags = {
#     Name = "primary_network_interface my_subnet"
#   }
# }