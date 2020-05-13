
#gateway
#elb
#vpc
#subnet
#security_group
#ec2
#rds


#Gateway 作成
resource "awscloud_gateway" "gateway" {
  id = "${lookup(var.gateway, "id")}"
  vpc = "${lookup(var.vpc, "id")}"
}

# ELB
resource "awscloud_elb" "elb" {
  name = "${lookup(var.elb, "name")}"
  dns = "${lookup(var.elb, "dns")}"
  vpc_id = "${lookup(var.elb, "vpc_id")}"
  availability_zone = "${lookup(var.elb, "availabirity_zone")}"
  security_group_id = "${lookup(var.elb, "security_group")}"
}

# VPC 作成
resource "awscloud_vpc" "vpc" {
  name       = "${lookup(var.vpc, "name")}"
  cidr_block = "${lookup(var.vpc, "cidr_block")}"
  id = "${lookup(var.vpc, "id")}"
}

#VPC subnet 作成

resource "awscloud_subnet" "public_zone_a" {
  vpc_id            = "${var.public_zone_a.id}"
  cidr_block        = "${lookup(var.public_zone_a, "cidr_block")}"
  availability_zone = "${lookup(var.public_zone_a, "availability_zone")}"
  name              = "${lookup(var.public_zone_a, "name")}"
}
resource "awscloud_subnet" "public_zone_c" {
  vpc_id            = "${var.public_zone_c.id}"
  cidr_block        = "${lookup(var.public_zone_c, "cidr_block")}"
  availability_zone = "${lookup(var.public_zone_c, "availability_zone")}"
  name              = "${lookup(var.public_zone_c, "name")}"
}
resource "awscloud_subnet" "private_zone_a" {
  vpc_id            = "${var.private_zone_a.id}"
  cidr_block        = "${lookup(var.private_zone_a, "cidr_block")}"
  availability_zone = "${lookup(var.private_zone_a, "availability_zone")}"
  name              = "${lookup(var.private_zone_a, "name")}"
}
resource "awscloud_subnet" "private_zone_c" {
  vpc_id            = "${var.private_zone_c.id}"
  cidr_block        = "${lookup(var.private_zone_c, "cidr_block")}"
  availability_zone = "${lookup(var.private_zone_c, "availability_zone")}"
  name              = "${lookup(var.private_zone_c, "name")}"
}


#SecurityGroup
resource "awscloud_security" "securitygroup_webuser1" {
  name = "${lookup(var.securitygroup_webuser1, "name")}"
  id = "${lookup(var.securitygroup_webuser1, "id")}"
  vpc_id = "${lookup(var.securitygroup_webuser1, "vpc_id")}"
}
resource "awscloud_security" "securitygroup_dbuser1" {
  name = "${lookup(var.securitygroup_dbuser1, "name")}"
  id = "${lookup(var.securitygroup_dbuser1, "id")}"
  vpc_id = "${lookup(var.securitygroup_dbuser1, "vpc_id")}"
}

#EC2

resource "awscloud_ec2" "server1" {
  name = "${lookup(var.server1, "name")}"
  id = "${lookup(var.server1, "id")}"
  availability_zone = "${lookup(var.server1, "availability_zone")}"
  security_group = "${lookup(var.server1, "security_group")}"
}
resource "awscloud_ec2" "server2" {
  name = "${lookup(var.server2, "name")}"
  id = "${lookup(var.server2, "id")}"
  availability_zone = "${lookup(var.server2, "availability_zone")}"
  security_group = "${lookup(var.server2, "security_group")}"
}

# RDS
resource "awscloud_database" "bookuser1" {
  name = "${lookup(var.securitygroup_dbuser1, "name")}"
  id = "${lookup(var.securitygroup_dbuser1, "id")}"
  vpc_id = "${lookup(var.securitygroup_dbuser1, "vpc_id")}"
}