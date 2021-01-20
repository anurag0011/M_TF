### Build Networks
# Primary
resource "aws_subnet" "web_subnet" {
    vpc_id     = aws_vpc.primary.id
    count      = length(data.aws_availability_zones.available.names)
    cidr_block = cidrsubnet(aws_vpc.primary.cidr_block, 8, count.index)
    availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
        Name = "web_${count.index}"
    }
}

resource "aws_subnet" "db_subnet" {
    vpc_id     = aws_vpc.primary.id
    count      = length(data.aws_availability_zones.available.names)
    cidr_block = cidrsubnet(aws_vpc.primary.cidr_block, 8, (count.index + 10))
    availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
        Name = "db_${count.index}"
    }
}

resource "aws_subnet" "app_subnet" {
    vpc_id     = aws_vpc.primary.id
    count      = length(data.aws_availability_zones.available.names)
    cidr_block = cidrsubnet(aws_vpc.primary.cidr_block, 8, (count.index + 20))
    availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
        Name = "app_${count.index}"
    }
}