resource "aws_vpc" "mainvpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = {
      Name = "VPC_TF"
    }
}

resource "aws_security_group" "allowssh" {
        name = "allow_ssh"
        description = "allow ssh inbound/outbound traffic"
        vpc_id = "${aws_vpc.mainvpc.id}"

        ingress {
         from_port   = 22
         to_port     = 22
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
        }
        egress {
         from_port   = 0
         to_port     = 0
         protocol    = "-1"
         cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "SecurityGroup-TF"
  }
   depends_on = [aws_vpc.mainvpc] 
  }

  resource "aws_internet_gateway" "gw" {
     vpc_id = "${aws_vpc.mainvpc.id}"

  tags = {
    Name = "IGW-TF"
  }

  depends_on = [aws_vpc.mainvpc]
}

resource "aws_eip" "EIP" {
  domain   = "vpc"
  tags = {
    Name = "EIP"
  }
}

resource "aws_nat_gateway" "NATGW" {
  allocation_id = aws_eip.EIP.id
  subnet_id = aws_subnet.PublicSubnet_A.id
  tags = {
    Name = "NATGW"
  }
  depends_on = [ aws_eip.EIP, aws_subnet.PublicSubnet_A ]
  
}