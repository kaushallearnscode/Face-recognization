provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

resource "aws_instance"  "instance"  {
  ami           = "ami-0ad704c126371a549"
  instance_type = "t2.micro"

 tags = {
  Name = "Task6_OS"
 }
}

resource "aws_ebs_volume" "volume" {
  availability_zone = "ap-south-1a"
  size              = 5

  tags = {
    Name = "Task6_vol"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume.id
  instance_id = aws_instance.instance.id
}

