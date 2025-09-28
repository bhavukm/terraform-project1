project_name = "tf-starter"
env = "dev"
region = "us-east-1"

vpc_cidr = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
az_count = 2
key = train2

enable_nat_gateway = true

# Restrict this to your IP in production. 0.0.0.0/0 is used here for demo only.
allowed_ssh_cidrs = ["0.0.0.0/0"]

# Optional tags
tags = {
  Owner = "bhavuk"
}