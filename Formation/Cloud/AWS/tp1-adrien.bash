#!/bin/bash

#Some constants.
CIDR='92.154.7.26'
VPC_CIDR=$CIDR'/16'
SUBNET1_CIDR=$CIDR'/24'
SUBNET2_CIDR='92.154.8.26/24'
INSTANCE_TYPE='t2.micro'
PEM_KEYS_FILE=tp-deploy-aws-keys.pem
KEY_NAME=tp-deploy-aws-keys
IMAGE_ID='resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2'

#Create VPC.
VPC_ID=$(aws ec2 create-vpc --cidr-block $VPC_CIDR --query 'Vpc.{VpcId:VpcId}' --output text)

#Create two subnets, one that will be public (SUBNET1) the other that will stay private (SUBNET2).
SUBNET1_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET1_CIDR --query 'Subnet.{SubnetId:SubnetId}' --output text)
SUBNET2_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET2_CIDR --query 'Subnet.{SubnetId:SubnetId}' --output text)

#Make one of the two subnets public
##Create a gateway.
INTERNET_GATEWAY_ID=$(aws ec2 create-internet-gateway --query 'InternetGateway.{InternetGatewayId:InternetGatewayId}' --output text)
##Attach the gateway to the vpc.
aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $INTERNET_GATEWAY_ID
##Create a route table for the vpc.
ROUTE_TABLE_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID --query 'RouteTable.{RouteTableId:RouteTableId}' --output text)
##Add a route to the route table, linked to the gateway.
aws ec2 create-route --route-table-id $ROUTE_TABLE_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $INTERNET_GATEWAY_ID
##Associate the route table to the public subnet.
aws ec2 associate-route-table  --subnet-id $SUBNET1_ID --route-table-id $ROUTE_TABLE_ID
##Make the ip of the public subnet public. Other solution would be to use an elastic ip.
aws ec2 modify-subnet-attribute --subnet-id $SUBNET1_ID --map-public-ip-on-launch

#Create key pair if it does not already exist, then manage the rights on that key.
if [ ! -f $PEM_KEYS_FILE ]; then
	aws ec2 create-key-pair --key-name $KEY_NAME --query 'KeyMaterial' --output text > $PEM_KEYS_FILE
fi
sudo chmod 400 $PEM_KEYS_FILE


#Create a new security group.
GROUP_ID=$(aws ec2 create-security-group --group-name tp1-install-website --description 'tp1-install-website' --vpc-id $VPC_ID --query '{GroupId:GroupId}' --output text)

#Create rule to open ports 22 (ssh) and 80 (http) with the new security group.
aws ec2 authorize-security-group-ingress --group-id $GROUP_ID --protocol tcp --port 22 --cidr $VPC_CIDR
aws ec2 authorize-security-group-ingress --group-id $GROUP_ID --protocol tcp --port 80 --cidr $VPC_CIDR

#Launch the instance.
INSTANCE_ID=$(aws ec2 run-instances --image-id $IMAGE_ID --count 1 --instance-type $INSTANCE_TYPE --key-name $KEY_NAME --security-group-ids $GROUP_ID --subnet-id $SUBNET1_ID --query 'Instances[0].{InstanceId:InstanceId}' --output text)

#Get the instance IP.
INSTANCE_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].{PublicIpAddress:PublicIpAddress}' --output text )

#ssh connect to the EC2 instance
ssh -o "StrictHostKeyChecking no" $INSTANCE_IP
ssh -i $PEM_KEYS_FILE.pem ec2-user@$INSTANCE_IP

#Install utilitaries.
yum install httpd openssl php-common php-curl php-json php-mbstring php-mysql php-xml php-zip
yum install mysql-server
service mysqld start
mysqladmin -u root create blog
mysql_secure_installation

#Get wordpress core.
cd /var/www/html
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest-fr_FR.tar.gz . 
