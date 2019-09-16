provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "Deepak" {
  ami           = "ami-0cb0e70f44e1a4bb5"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
}


resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.Deepak.id}"
  instance_id = "${aws_instance.Deepak.id}"
}

resource "aws_ebs_volume" "Deepak" {
  availability_zone = "ap-south-1a"
  size              = 1
}