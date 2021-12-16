provider "aws" {
    region = "ap-south-1"
    shread_credentials_file ="C:/Users/mikki.kumari/.aws/credentials"
    profile ="default"
}
module "server" {
    sourcev = "C:/terraform/modules/sample/webserver"
    vpc_id = aws_vpc.main.id
    cidr_block= "10.0.0.0/16"
    ami ="ami-08ee6644906ff4d6c"
    subnet_id = aws-subnet.public.id
    server2 = "Server2"
}
