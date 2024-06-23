provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 1)
  map_public_ip_on_launch = true
  availability_zone = element(["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"], count.index)
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table_association" "public" {
  count = 2
  subnet_id = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "public_internet_access" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_instance" "public_instance" {
  ami = var.ami
  count = 2
  key_name = var.key_pair
  instance_type = var.instance_type[0]
  user_data = file("${path.module}/java.sh")
  subnet_id = element(aws_subnet.public.*.id, count.index)
  vpc_security_group_ids = [aws_security_group.public_sg.id] 
  tags = {
    Name = "PrivateInstance${count.index + 1}"
  }
}




