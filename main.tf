provider "aws" {
    region = "ap-south-1"
    shared_credentials_file = " C:/Users/mikki.kumari/.aws/credentials "
}
resource "aws_instance" "web" {
    ami ="ami-08ee6644906ff4d6c"
    instance_type ="t2.micro"
    tags = {
        Name = "server1"
    }

}
