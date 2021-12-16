variable "vpc_id" {
    type = string
    description = vpc_id
}
variable "cidr_block" {
    type =string
    description = "subnet cidr_id"
}
variable "instance_type" {
    type = string
    description = "type of instance"
    default = "t2.micro"
}
variable "ami" {
    type= string
    description= "use for creating webserver"
}
variable "subnet_id" {
    type = string
    description = "subnet id for vpc"
}
variable "server_name" {
    type= string
    description= "server name"
}