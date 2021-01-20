### Variables
variable "access_key" {}
variable "secret_key" {}
variable "vpc_dr" {
    type = string
	default = "app1_vpc_iaas_DR"
}