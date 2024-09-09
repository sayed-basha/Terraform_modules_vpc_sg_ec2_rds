output "public_ec2_id" {
    value = aws_instance.public-vm.*.id
}

output "private_ec2_id" {
    value = aws_instance.private-vm.*.id
}