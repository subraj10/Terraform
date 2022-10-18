# create a vpc
# terraform aws create vpc
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc-cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true
    tags = {

        Name = "test vpc"
    }
}

# create internet gateway and attach to vpc 
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet-gateway" {
    vpc_id = aws_vpc.vpc.id
    tags = {

        Name = "test igw"
    }
}

# create a public subnet 1
# terraform aws create public subnet 
resource "aws_subnet" "public-subnet-1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public-subnet-1-cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "test-public-subnet-1"
    }
}

# create a public subnet 2
# terraform aws create public subnet 
resource "aws_subnet" "public-subnet-2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public-subnet-2-cidr
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet-2"
    }
}

# create a route table and add a public route 
# terraform aws create route table 
resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "egress"
  }
}



# Associate public subnet 1 to public route table 
# terraform aws associate subnet with route table 
resource "aws_route_table_association" "public-subnet-1-route-table-association" {

  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.route-table.id
}
    


# Associate public subnet 2 to public route table 
# terraform aws associate subnet with route table 
resource "aws_route_table_association" "public-subnet-2-route-table-association" {

    subnet_id = aws_subnet.public-subnet-2.id
    route_table_id = aws_route_table.route-table.id
} 


# create private subnet 1
# terraform aws create subnet
resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private-subnet-1-cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false

    tags = {
        Name = "private-subnet-1"
    }
}

# create private subnet 2
# terraform aws create subnet
resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private-subnet-2-cidr
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false

    tags = {
        Name = "private-subnet-2"
    }
}

# create private subnet 3
# terraform aws create subnet
resource "aws_subnet" "private-subnet-3" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private-subnet-3-cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false

    tags = {
         Name = "private-subnet-3"
    
    }
}
       

# create private subnet 4
# terraform aws create subnet
resource "aws_subnet" "private-subnet-4" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private-subnet-4-cidr
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false

    tags = {
        Name = "private-subnet-4"
    }
}
