resource "aws_security_group" "http" {
	 name = "http_security_group"
	 ingress {
	 	 description = "http for all"
		 from_port = 80
		 to_port = 80
		 protocol = "tcp"
		 cidr_blocks = ["74.79.75.75/32"]
	}

	egress {
	       	 from_port = 0
		 to_port = 0
		 protocol = "-1"
		 cidr_blocks = ["0.0.0.0/0"]
	 }
	
}
resource "aws_security_group" "ssh" {
	 name = "sh_security_group"
	 ingress {
	 	 description = "http for all"
		 from_port = 22
		 to_port = 22
		 protocol = "tcp"
		 cidr_blocks = ["74.79.75.75/32"]
	}

	egress {
	       	 from_port = 0
		 to_port = 0
		 protocol = "-1"
		 cidr_blocks = ["0.0.0.0/0"]
	 }
	
}
