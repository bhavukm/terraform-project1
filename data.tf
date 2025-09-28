# Get availability zones from the region dynamically
data "aws_availability_zones" "available" {
  state = "available"
}