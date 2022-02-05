#////////////////////////////////
#  Variables
#////////////////////////////////
variable "web_app_name" {
  type = string
}
variable "whitelist" {
  type = list(string)
}
variable "web_instance_type" {
  type = string
}
variable "web_key_name" {
  type = string
}

#//////////////////////////////
#       resouce ec2
#//////////////////////////////
resource "aws_instance" "jenkins" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.web_instance_type
  key_name        = var.web_key_name
  security_groups = [aws_security_group.aws_jenkins.name]


  tags = {
    Terraform = "true"
    Name      = "Jenkins"
  }
}

output "aws_instance_jenkins" {

  value       = aws_instance.jenkins.public_ip
  description = "Jenkins public ip "
}
output "aws_instance_jenkins_dns" {

  value       = aws_instance.jenkins.public_dns
  description = "Jenkins public dns "
}
