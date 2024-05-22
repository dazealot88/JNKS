
//creating 2 ec2 instances

resource "aws_instance" "demo" {
    ami = "ami-08012c0a9ee8e21c4"
    instance_type = "t2.micro"
    key_name = "US-WEST-1-KEY"
    count = 2
  
  tags = {
    Name = "Demo"
  }
}