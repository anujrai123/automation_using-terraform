#Automating Infrastructure Using Terraform

##Table of Contents
* 	VPC Creation
* 	AWS EC2 Instance Creation
* 	Creating Application Load Balancer (For Internet)
* 	Target Group Creation
* 	Autoscaling Group


##So, let's get started.

## VPC Creation

###Table Of Contents

* VPC
* Internet Gateway Creation
* Subnet Creation
* Route Table


1. Creating one **VPC(main)** which can support up to 65000 hosts.
2. Created 4 subnet under two availability zone.
 * 2 public
 * 2 private
 availabilty_zone1=public_1 and private_1
 availability_zone2=public_2 and private_2
3. Created route table for routing request internally and externally.
4. Public route table is connected with internet(internet_gateway) and internally.
5. Private using the default route table for private as its not connected to the internet gateway also the inbound rule is local.
6. Created an internet gateway and map it with Public route table.

## AWS EC2 Instance Creation

Creating 2 AWS EC2 t2.micro instance under the created **VPC(main)** using the private subnet as they will be internet facing and installing the **Nginx** as web server.
Created a security group to open communication for limited number of ports for webserver and SSH (accessible Custom IP range)

## Application load Balancer

AWS provide three type of load balancer
* Application load Balancer
* Network Load Balancer
* Gateway Load Balancer
As per our requirement we are making use of Application Load Balancer exposing it to the end user, using protocol **HTTP(less secure)** as we don't have certificates and exposing the listener port 80 for communication.
Since we created 2 AWS EC2 instance in previous step we are using them in target group by using the functionality use by **Instance** to cater the request of the end user. Also, we have created health_check of the server to make sure they are up and running for every 30 seconds interval by running curl command and any kind of custom script like keep_alive, ping etc.


## Autoscaling

In the Autoscaling group we are scaling up the envitronment based upon the number of requests or load.

##module

Created a module for EC2 key, VPC creation, security groups, subnet ids for both public and private.
