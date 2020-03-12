#!/bin/bash


# Spin up Env (based on AWS Free Tier defaults)
pushd ./terraform
terraform apply
popd

api_ip = `terraform output --state ./terraform/terraform.tfstate ip`

# Copy api code up to api vm
scp timeapi.py ec2-user@$api_ip:/home/ec2-user
scp timeapi.ini ec2-user@$api_ip:/home/ec2-user
scp wsgi.py ec2-user@$api_ip:/home/ec2-user

# Copy up nginx config, install nginx
scp nginx.repo ec2-user@$api_ip:/home/ec2-user
ssh ec2-user@$api_ip "sudo mv nginx.repo /etc/yum.repos.d/"
ssh ec2-user@$api_ip "sudo yum -y install python3.x86_64 nginx"

# Install python requirements
scp requirements.txt ec2-user@$api_ip:/home/ec2-user
ssh ec2-user@$api_ip "python3 -m pip install -r requirements.txt --user "

# Move service config, start service
scp timeapi.service ec2-user@$api_ip:/home/ec2-user
ssh ec2-user@$api_ip "sudo systemctl start timeapi.service"
ssh ec2-user@$api_ip "sudo systemctl enable timeapi"

