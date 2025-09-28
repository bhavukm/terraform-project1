locals {
  env_suffix  = "-${var.env}"
  name_prefix = "${var.project_name}${local.env_suffix}"

  common_tags = merge({
    Project     = var.project_name
    Environment = var.env
    ManagedBy   = "terraform"
  }, var.tags)

  azs = slice(data.aws_availability_zones.available.names, 0, var.az_count)
}