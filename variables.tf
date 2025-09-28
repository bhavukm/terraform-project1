variable "project_name" {
  type    = string
  default = "tf-starter"
}

variable "env" {
  type    = string
  default = "dev"
}
variable "key" {
  type    = string
  default = "train2"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "az_count" {
  type    = number
  default = 2
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "allowed_ssh_cidrs" {
  type    = list(string)
  description = "CIDRs allowed to SSH to the bastion. DO NOT leave 0.0.0.0/0 in production."
  default = ["0.0.0.0/0"]
}

variable "tags" {
  type    = map(string)
  default = {}
}