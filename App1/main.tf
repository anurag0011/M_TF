### Variables
variable "access_key" {}
variable "secret_key" {}

### Initialize Providers
# Primary
provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    alias = "east1"
    region = "us-east-1"
}

# DR
provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    alias  = "west1"
    region = "us-west-1"
}

### Modules
module "Production" {
    source = "./Modules/Production/"
    providers = {
        aws = aws.east1
    }
}

module "DR" {
    source = "./Modules/DR/"
    providers = {
        aws = aws.west1
    }
}