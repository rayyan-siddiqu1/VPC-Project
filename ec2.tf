resource "aws_instance" "PublicEC2" {
  ami = "ami-0492447090ced6eb5"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allowssh.id}"]
  subnet_id = aws_subnet.PublicSubnet_A.id
  key_name = "myec2keypair"
  tags = {
    Name = "PublicEC2"
}
depends_on = [ aws_vpc.mainvpc, aws_subnet.PublicSubnet_A ]
}

resource "aws_instance" "PrivateEC2" {
  ami = "ami-0492447090ced6eb5"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allowssh.id}"]
  subnet_id = aws_subnet.PrivateSubnet_A.id
  key_name = "myec2keypair"
  tags = {  
    Name = "PrivateEC2"
}
depends_on = [ aws_vpc.mainvpc, aws_subnet.PrivateSubnet_A ]
}

