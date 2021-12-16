terraform {
    required_version = '>=1.1.1"
}
resource "aws_vpc" "main" {
    cidr_block =var.cidr_block
}
resource "aws_subnet" "public" {
  vpc_id     = var.vpc.id
  cidr_block = var.cidr_block
}
resource "aws_instance" "server2" {
    instance_type = var.instance_type
    ami =var.ami
    subnet_id =var.subnet_id
    tags = {
        name = "${var.server_name} server2"
    }
}