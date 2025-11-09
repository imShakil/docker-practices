provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_key_pair" "ssh-key" {
  key_name = "docker-vm"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "vm" {
  ami = "ami-0827b3068f1548bf6"
  instance_type = "t2.micro"
  key_name = aws_key_pair.ssh-key.key_name

  user_data_base64 = base64encode(file("../docker-deploy.sh"))
}

output "ec2-ip" {
  value = aws_instance.vm.public_ip
}
