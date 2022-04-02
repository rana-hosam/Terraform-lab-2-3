
resource "aws_instance" "server1"{
ami = "ami-00ee4df451840fa9d"
instance_type = "t2.micro"
tags = {
Name = "my terraform instance"
}

}

resource "aws_key_pair" "key_p"{
key_name="my_key_p"
public_key= "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbynECx1I4bg8MAXPKg9ntrwY3Mhh0mazyL4fgvn01y2kgnEfU+M0qsNdt5Bc3PevJG62Pj1tQSRNxQu3JOj9mzHylWR+cYGwtnJjMlS04fMcnZnqzN3emRT1Typ7C6/1Vu6lWrQNDGWBpPD4aVHpxq5j6suMzWq3Yyvo7M79Q4s160fw6eiwoy22KZn0kph8Q3twMBx8Na0ApBcsNHEfWvxJWKyPat1I8+gkQHsh699OerckY/8yXsvOtfsNTXXe+Belro7ZmTknVEVL5rKNLkRQJM70ETvvf4lwm8tFS8MDFHkAshjQCo5jVCdVpDoiz1tmQbu3xAbI504zePSB5x0D9dlSCHLJ13uIRem0jKUgWNG+bgIik3R2u1T8lfr4e2PFHdO633WjVw3lT6FfegnydyL1Ai0Hnpe+3NkGMhn/2uLZhJVDbKf8X88fpe/iQO+xIhqPKJ23JBaWeCSRFLaxcpiDR5cb/ApKaJFEzHSqNloOewYg9qxtkDxle4iU= Rana@DESKTOP-I6JP8EO"
}

resource "aws_security_group" "my_SG"{
name = "my_SG"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0f4bba1c09990f323"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["172.31.0.0/16"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
