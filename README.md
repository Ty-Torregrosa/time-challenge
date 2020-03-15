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

# Walk through

Idea:
We have a python app, timeapi.py, that utilizes the Flask framework to create an web app.
The web app has one endpoint /time, which returns the current time.

The web app can be run as systemd service, load balanced using uwsgi, and served by nginx.

All of this is hosted on an aws vm, created by terraform in an default free aws account.

The time client app (python) sends requests to the time api.

We have a test_blue_green.sh script to deploy the app onto the vm, run the client app and do a blue green deployment of a v2 app. The output of the client app should return zero failed requests to the api.