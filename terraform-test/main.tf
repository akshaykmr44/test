# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"  #REGION Defined as us-west-1 in Variable.tf
  shared_credentials_file = "/Users/akskumar/.aws/credentials"
  profile                 = "terraform"
}

resource "aws_vpc" "vpc-11111111" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "Tidal-Test-VPC"
    Service = "test_service"
  }
}

resource "aws_subnet" "subnet-aaaaaaaa" {
  vpc_id                  = "${aws_vpc.vpc-11111111.id}"
  cidr_block              = "10.0.0.1/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags {
    Name = "Tidal-Test_Subnet-A"
    Service = "test_service"
  }
}

resource "aws_subnet" "subnet-bbbbbbbb" {
  vpc_id                  = "${aws_vpc.vpc-11111111.id}"
  cidr_block              = "10.0.16.0/24"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true

  tags {
    Name = "Tidal-Test_Subnet-B"
    Service = "test_service"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc-11111111.id}"

  tags {
    Name = "Tidal-Test_ig"
    Service = "test_service"
  }
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.vpc-11111111.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Tidal-Test_Route_Table"
    Service = "test_service"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.subnet-aaaaaaaa.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.subnet-bbbbbbbb.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_security_group" "elbsg" {
  name = "Tidal-Test_ELB_SG"
  description = "Load Balancer Security Group Allow incoming and ougoing HTTP connections"

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id="${aws_vpc.vpc-11111111.id}"

  tags {
    Name = "Tidal-Test_ELB_Security_Group"
    Service = "test_service"
  }
}

data "aws_elb_service_account" "main" {}
resource "aws_s3_bucket" "bucket" {
  bucket = "tidal-elb-logs"
  acl    = "private"

policy = <<POLICY
{
  "Id": "Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::tidal-elb-logs/*",
      "Principal": {
        "AWS": [
          "${data.aws_elb_service_account.main.arn}"
        ]
      }
    }
  ]
}
POLICY
}

# Creating the load balancer
resource "aws_elb" "web" {
  name = "TidalTestELB"
  subnets = ["${aws_subnet.subnet-aaaaaaaa.id}","${aws_subnet.subnet-bbbbbbbb.id}"]

  security_groups = ["${aws_security_group.elbsg.id}"]

  access_logs {
    bucket        = "${aws_s3_bucket.bucket.bucket}"
    bucket_prefix = "TidalTestELB"
    interval      = 5
  }

  listener {
    instance_port      = 8080
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    #ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"  #This was a dummy URL so i have used my certificate below and it worked.
    ssl_certificate_id = "arn:aws:acm:us-west-2:536113069127:certificate/c48c29f1-1abf-4961-ad19-98ec330c5764"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 2
    target              = "HTTP:8000/health"
    interval            = 10
  }

  tags {
    Name = "TidalTestELB"
    Service = "test_service"
  }
}

# Application security group to access the Application over HTTP by ELB
resource "aws_security_group" "appsg" {
  name        = "Tidal-Test_APP_SG"
  description = "Application Security Group Allow incoming and ougoing HTTP connections"

  vpc_id = "${aws_vpc.vpc-11111111.id}"

  # HTTP access from Only ELB Security Group
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    security_groups = ["${aws_security_group.elbsg.id}"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Tidal-Test_App_Security_Group"
    Service = "test_service"
  }
}