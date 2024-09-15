variable "vpc_cidr" {}
variable "vpc_name" {}
variable "availability_zone" {}
variable "cidr_public_subnet" {}
variable "cidr_private_subnet" {}


output "dev_project_vpc_id" {
  value = aws_vpc.dev_project_vpc.id
}

output "dev_project_vpc_publicsubnet_id" {
  value = aws_subnet.dev_public_subnet.*.id
}

output "dev_project_vpc_privatesubnet_id" {
  value = aws_subnet.dev_private_subnet.*.id
}

resource "aws_vpc" "dev_project_vpc" {
	cidr_block = var.vpc_cidr
	tags = {
		Name = var.vpc_name
	}
}

resource "aws_subnet" "dev_public_subnet" {
  count   = length(var.cidr_public_subnet)
  vpc_id  = aws_vpc.dev_project_vpc.id
  cidr_block = element(var.cidr_public_subnet, count.index)
  availability_zone  = element(var.availability_zone, count.index)
  
  tags = {
    Name = "dev-proj-public-subnet-${count.index + 1}"
  }
}



resource "aws_subnet" "dev_private_subnet" {
  count   = length(var.cidr_private_subnet)
  vpc_id  = aws_vpc.dev_project_vpc.id
  cidr_block = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.availability_zone, count.index)
  
   tags = {
    Name = "dev-proj-private-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "dev_project_internet_gateway" {
  vpc_id  = aws_vpc.dev_project_vpc.id
  tags = {
	Name = "dev_project_igw"
}
}

resource "aws_route_table" "dev_public_routeTable" {
  vpc_id = aws_vpc.dev_project_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_project_internet_gateway.id
}
  tags = {
        Name = "dev_project_public_routeTable"
	}
}

resource "aws_route_table_association" "dev_project_RT_association" {
  count = length(aws_subnet.dev_public_subnet)
  subnet_id = aws_subnet.dev_public_subnet[count.index].id
  route_table_id = aws_route_table.dev_public_routeTable.id
}


resource "aws_route_table" "dev_private_routeTable" {
  vpc_id = aws_vpc.dev_project_vpc.id
  tags = {
	Name = "dev-project_private_routeTable"
}
}







