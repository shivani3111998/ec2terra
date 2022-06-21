# Create VPC
# terraform aws create vpc
resource "aws_vpc" "vp" {
  cidr_block              = "${var.vpc-cidr}"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "vp"
  }
}


# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "private-subnet-1" {
  vpc_id                   = aws_vpc.vp.id
  cidr_block               = "${var.private-subnet-1-cidr}"
  availability_zone        = "ap-south-1a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private Subnet 1 | App Tier"
  }
}

