# time-challenge
## Requirements
* Write a web application in your language of choice that returns the current date/time in JSON
* Write a simple test application that will query this “API” X times per second and record success/failure/TTLB (Time to last byte)
* Perform a blue-green deploy with the method/technology of your choosing while the test application is running and demonstrate there were no failed requests
* Go from a single instance of v1 to a single instance of v2 gracefully



# Prerequisites

* aws cli
docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

* terraform cli
terraform.io/downloads.html

* create key pair 
ssh-keygen rsa
Copy public key material into terraform

Move the private key into ~/.ssh/id_rsa

The script will use this key to connect to the ec2 instance it spins up to do the testing.


# Testing
run the script
test_blue_green.sh