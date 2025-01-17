##########################
# Network infrastructure #
##########################

resource "aws_vpc" "master" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

#########################################################
# Internet Gateway needed for inbound access to the ALB #
#########################################################
resource "aws_internet_gateway" "master" {
  vpc_id = aws_vpc.master.id

  tags = {
    Name = "${local.prefix}-master"
  }
}


##################################################
# Public subnets for load balancer public access #
##################################################
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.master.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_region.current.name}a"

  tags = {
    Name = "${local.prefix}-public-a"
  }
}

resource "aws_route_table" "public_a" {
  vpc_id = aws_vpc.master.id

  tags = {
    Name = "${local.prefix}-public-a"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_a.id
}

resource "aws_route" "public_internet_access_a" {
  route_table_id         = aws_route_table.public_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.master.id
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.master.id
  cidr_block              = "10.1.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_region.current.name}b"

  tags = {
    Name = "${local.prefix}-public-b"
  }
}

resource "aws_route_table" "public_b" {
  vpc_id = aws_vpc.master.id

  tags = {
    Name = "${local.prefix}-public-b"
  }
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_b.id
}

resource "aws_route" "public_internet_access_b" {
  route_table_id         = aws_route_table.public_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.master.id
}

############################################
# Private Subnets for internal access only #
############################################
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.master.id
  cidr_block        = "10.1.10.0/24"
  availability_zone = "${data.aws_region.current.name}a"

  tags = {
    Name = "${local.prefix}-private-a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.master.id
  cidr_block        = "10.1.11.0/24"
  availability_zone = "${data.aws_region.current.name}b"


  tags = {
    Name = "${local.prefix}-private-b"
  }
}
