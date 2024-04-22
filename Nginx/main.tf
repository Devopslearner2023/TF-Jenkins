data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "myapp-server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = "Aws-key-2024"
  associate_public_ip_address = true
  user_data                   = file("script2.sh")
  tags = {
    Name = "web-server"
  }
}
