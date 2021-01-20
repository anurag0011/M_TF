### Variables
variable "access_key" {}
variable "secret_key" {}
variable "vpc_primary" {
    type = string
	default = "app1_vpc_iaas_prim"
}