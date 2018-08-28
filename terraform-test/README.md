## Terraform

Write a simple AWS configuration using Terraform (https://www.terraform.io/docs/index.html). Just the required resources - don't configure the provider.

* All resources should have sensible naming and descriptions. All should be tagged with key: `Service`, value: `test_service`.
* Do not create or associate any instances. The environment will just be set up ready for instances to be deployed.
* Everything will be using EC2 VPC (not EC2 Classic). Use the VPC id `vpc-11111111`.

The following resources should be configured:

### ELB security group (`aws_security_group`)

* Allow unrestricted access to port 443 (HTTPS)
* Allow all egress

### ELB (`aws_elb`)

* Subnets: `subnet-aaaaaaaa`, `subnet-bbbbbbbb`
* Access logs to `tidal-logs` S3 bucket, prefix `elb/<name>`, every 5 minutes (Where `<name>` is the name you give the ELB)
* Listen on port 443 HTTPS, direct to the instances on port 8080 HTTP. Certificate `arn:aws:iam::123456789012:server-certificate/certName`
* Health check to `/health` every 10s. Healthy/Unhealthy threshold 3. Timeout 2s.
* Security group: The ELB security group

### Application security group (`aws_security_group`)

* Allow access from the ELB security group on port 8080 (hint: use an ingress rule with security_groups)
* Allow all egress


##Completed:

Setup : To run this terrafrom you need to download the terraform https://www.terraform.io/downloads.html

Then We have to create two files main.tf and variabled.tf to write the code.

Once We write the code then run the following commands:

git clone https://github.com/terraform-providers/terraform-provider-aws.git
cd terraform-provider-aws/
./terraform init
./terraform plan -out outputs.tf
./terraform apply outputs.tf

##Changes which needs to be done to run it successfully.

The SSL certificate has to provide as i have provided my certificate and run it successfully. Please put certificate path and then run it.

listener {
    instance_port      = 8080
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    #ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"  #This was a dummy URL so i have used my certificate instead of this and it worked.
  }

