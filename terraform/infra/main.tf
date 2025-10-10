resource "aws_key_pair" "flask_key" {
  key_name   = var.key_name
  public_key = file("../flask-keygen.pub")
}

resource "aws_default_vpc" "aws_vpc" {
  tags = {
    Name = var.default_vpc_name
  }
}

resource "aws_security_group" "flask_sg" {
  vpc_id = aws_default_vpc.aws_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "SSH"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "HTTP"
  }

  ingress {
    from_port = 5000
    to_port = 5000
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Custom Port"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_instance" "flask" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name = aws_key_pair.flask_key.key_name
  security_groups = [ aws_security_group.flask_sg.name ]

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = var.instance_name
  }
}

resource "local_file" "ansible_inventory" {
  depends_on = [ aws_instance.flask ]
  filename = "$path.module}/../../ansible/inventory.ini"
  content = aws_instance.flask.public_ip
}