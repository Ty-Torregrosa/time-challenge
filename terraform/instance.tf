resource "aws_instance" "api" {
	 ami = "ami-0e38b48473ea57778"
	 instance_type = "t2.micro"
	 vpc_security_group_ids = [ aws_security_group.http.id, aws_security_group.ssh.id ]
	 key_name = aws_key_pair.api.key_name
}