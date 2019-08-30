
resource "aws_instance" "terraform_server" {
  ami           = "ami-035b3c7efe6d061d5"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform Server"
  }
  subnet_id = "${aws_subnet.subnet2.id}"
}