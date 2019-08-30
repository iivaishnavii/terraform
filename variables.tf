variable "cidr_block" {
    default = "10.0.0.0/16"
    type    = "string"
}

variable "availability_zones" {
    type = "map"
    default = {
         zone1 = "us-east-1a"
         zone2 = "us-east-1b"
    }
   
}

output "first_output" {
    value = "First output form terraform"
}

output "cidr_block" {
    value = "${aws_subnet.subnet2.cidr_block}"
}