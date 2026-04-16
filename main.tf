resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16" 
  
  tags = {
    Name = "002V-duocapp-vpc" 
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "002V-duocapp-subnet" 
  }
}

resource "aws_security_group" "ssh_access" {
  name        = "002V-duocapp-sg"
  description = "Permitir trafico SSH"
  vpc_id      = aws_vpc.main.id

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
    Name = "002V-duocapp-sg" 
  }
}

resource "aws_instance" "web_server" {
  ami           = "ami-05b10e08d247fb927" 
  instance_type = "t2.micro"             
  subnet_id     = aws_subnet.subnet_a.id
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = "002V-duocapp-ec2" 
  }
}
resource "aws_security_group" "ssh_access" { #Se agregan recursos de grupos de seguridad 
  name        = "002V-duocapp-sg"
  description = "Permitir trafico SSH"
  vpc_id      = aws_vpc.main.id

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
    Name = "002V-duocapp-sg" 
  }
}

resource "aws_instance" "web_server" { #se agregan recursos de computo EC2
  ami           = "ami-05f991c49d264708f" 
  instance_type = "t2.micro"             
  subnet_id     = aws_subnet.subnet_a.id
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = "002V-duocapp-ec2" 
  }
}