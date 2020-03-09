resource "aws_instance" "api" {
	 ami = "ami-0e38b48473ea57778"
	 instance_type = "t2.micro"
	 vpc_security_group_ids = [ aws_security_group.http.id, aws_security_group.ssh.id ]
	 key_name = aws_key_pair.api.key_name
}

resource "aws_key_pair" "api" {
	 key_name = "api-instance-key"
	 public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqUMyrpI4JxSGuyb8iEv1KyzuwxOu+gAak7cbUCarRyHw49bP3DkuSwBIPuDYWRIQ3JBPbQYkUrCq3oQMrGNXjk/hNbMlBOQoRaf4snnduJIfWmZ+6PV2TStr9xblM3pzbKqhubvBEq3L61M+DEv5n8k53FdfWYGsA916WrTJHgav31ge3WBrYwnbuvhkp6j52zuCDDc4GyXgWab+qbLdbVcbCmvUht7DdjTZFnievCiaJSAL9qn4mtDbuoWDVUpK6CnqU9Qsdv24HXZYAtWR6/ZqjkV40CUBYaN/a8w3o7yuQtbvM18UytyNvh+YeRDtIV2zniJUKFRsx+LXIb23H"
}