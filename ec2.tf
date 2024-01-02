resource "aws_instance" "public_instance" {
  ami                         = "ami-0c7090bd76537f73d"
  instance_type               = "t2.micro"
  subnet_id                   = "aws_subnet.public-subnet.id"
  security_groups             = [aws_security_group.web-sg.id]
  associate_public_ip_address = true
  key_name                    = var.instance_key
}

resource "aws_instance" "private_instance" {
  ami             = "ami-0c7090bd76537f73d"
  instance_type   = "t2.micro"
  subnet_id       = "aws_subnet.private-subnet.id"
  security_groups = [aws_security_group.django-sg.id]
  key_name        = var.instance_key
}

output "public_instance_public_ip" {
  value = aws_instance.public_instance.public_ip
}