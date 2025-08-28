# 1. Create VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "TF-VPC" }
}

# 2. Create Subnet
resource "aws_subnet" "tf_subnet" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = { Name = "TF-Subnet" }
}

# 3. Create Security Group
resource "aws_security_group" "tf_sg" {
  name        = "TF-SG"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.tf_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "TF-SG" }
}

# 4. Create EC2 Instance
resource "aws_instance" "tf_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.tf_subnet.id
  vpc_security_group_ids = [aws_security_group.tf_sg.id]
  key_name               = var.key_name

  tags = { Name = "TF-Instance" }
}

