#Creación VPC
resource "aws_vpc" "vpc_proyecto" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name = "VPC_proyecto"
  }
}

#Creación Subnet Publica
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.vpc_proyecto.id
  cidr_block = "10.20.4.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "SNET_publica_proyecto"
  }
}

#Creación Subnets Privadas
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.vpc_proyecto.id
  cidr_block = "10.20.5.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "SNET_privada_proyecto"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.vpc_proyecto.id
  cidr_block = "10.20.6.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "SNET_privado2"
  }
}

resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.vpc_proyecto.id
  cidr_block = "10.20.7.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "SNET_privado3"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow_ssh"
  vpc_id      = aws_vpc.vpc_proyecto.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Habilitar_SSH"
  }
}
