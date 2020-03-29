data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "awskey"
  tags = {
    Name = "sentinel-vm"
    team = "presales"
    product = "weather"
    environment = "demo"
    owner = "rohitg"
    bu = "architects"
    function = "api"
    costcenters = "007"
  }
}