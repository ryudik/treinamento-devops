provider "aws" {
  region = "sa-east-1"
}


resource "aws_eip" "wes_eip" {
  
}
resource "aws_nat_gateway" "nat_gatway" {
  allocation_id = aws_eip.wes_eip.id
  subnet_id     = "${data.aws_subnet.test_subnet.0.id}"

  tags = {
    Name = "Ronaldo-NAT-GW"
  }

}
resource "aws_route_table" "nat_gateway" {
  vpc_id = "${data.aws_vpc.selected.id}"

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = "${aws_nat_gateway.nat_gatway.id}"
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "Ronaldo-RT-NAT-GW"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = "${data.aws_vpc.selected.id}"
  cidr_block        = "${var.private_subnets}"
  availability_zone = "${var.azs}"
  tags = {
    Name = "Ronaldo-PV-SUBNET"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = "${aws_subnet.private.id}"
  route_table_id = "${aws_route_table.nat_gateway.id}"
}
