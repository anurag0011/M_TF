### Build VPCs
# Primary
variable "vpc_primary" {
    type = string
	default = "app1_vpc_iaas_prim"
}

resource "aws_vpc" "primary" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
        Name = var.vpc_primary
    }
}

### Gather Info
# AZs
data "aws_availability_zones" "available" {
    state = "available"
}