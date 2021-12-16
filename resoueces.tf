
resource "aws_vpc" "my_vpc" {
    cidr_block ="10.0.0.0/16"
    tags = {
        name = "my_vpc"
    }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public subnet"
  }
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "private subnet"
  }
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "my_igw"
    }
}
resource "aws_eip" "nat_eip" {
  vpc = true

  depends_on  = [aws_internet_gateway.igw]
  tags ={
      name ="NAT_gw"
  }
}
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public.id
}
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
        tags = {
            Name = "public rt"
            
        }
    
}
resource "aws_route_table_association" "public"{
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat.id
    }
        tags = {
            Name = "private rt"
            
        }
    
}
resource "aws_route_table_association" "private"{
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
