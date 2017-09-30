provider "aws" {
	region = "ap-southeast-1"
}

resource "aws_instance" "Test1" {
	ami 			= "ami-fdb8229e"
	instance_type		= "t2.micro"
	vpc_security_group_ids  = ["${aws_security_group.instance.id}"]
        key_name   		= "manikey"
user_data = <<-EOF
             #!/bin/bash
             echo "Hello, World" > index.html
             nohup busybox httpd -f -p 8080 &
             EOF
tags {
	Name		= "Test-Trerraform"
	Owner		= "Manikandaprabu"
	Email		= "manikandaprabu.samikannu@hotmail.com"
}
}
resource "aws_launch_configuration" "example" {
  image_id        = "ami-fdb8229e"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}
