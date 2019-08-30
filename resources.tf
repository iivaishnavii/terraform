resource "aws_vpc" "terraform_vpc" {
  cidr_block           = "${var.cidr_block}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "terraform-aws-vpc-example"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block        = "${cidrsubnet(aws_vpc.terraform_vpc.cidr_block, 3, 1)}"
  vpc_id            = "${aws_vpc.terraform_vpc.id}"
  availability_zone = "${var.availability_zones["zone1"]}"
}

resource "aws_subnet" "subnet2" {
  cidr_block        = "${cidrsubnet(aws_vpc.terraform_vpc.cidr_block, 2, 2)}"
  vpc_id            = "${aws_vpc.terraform_vpc.id}"
  availability_zone = "${var.availability_zones["zone2"]}"
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"
  tags = {
    Name = "terraform subnet security"
  }
  ingress {
    cidr_blocks = ["${aws_vpc.terraform_vpc.cidr_block}"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
}

