resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id # ← G1

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

output "route_table_id" {
  value = aws_route_table.public.id
}