output "ec2-public-ip" {
    value = aws_instance.jenkins-1.public_ip
  
}
