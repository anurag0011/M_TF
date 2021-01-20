### Build Security Groups
# DR
resource "aws_security_group" "app_sg" {
    name        = "Allow Any"
    description = "Allow Any Traffic"
    vpc_id      = aws_vpc.dr.id

    ingress {
        description = "Allow any in"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow any out"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Allow Any"
    }
}