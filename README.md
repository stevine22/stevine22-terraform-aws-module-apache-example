Terraform module to provision an EC2 instance that is running apache. Not intended for ptodeuction use 


Just showcasing how to ceate a custom module on registry


```hcl

provider "aws" {
  region = "ca-central-1"
}

module "apache" {
   source = ".//terraform-aws-apache-example"
   vpc_id = "vpc-000000000000"
   my_ip_with_cidr = "MY_OWN_IP_ADDRESS/32"
   public_key = "ssh-rsa AAAAB"
   instance_type = "t2.micro"
   server_name = "Apache_server"
}

output "public_ip" {
   value = module.apache.public_ip
}

```