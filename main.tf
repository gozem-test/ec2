# AMI
data "aws_ami" "ami" {
  most_recent = var.most_recent_ami
  owners      = var.owners

  filter {
    name   = var.ami_name_filter
    values = var.ami_values_filter
  }
}

# EC2 Instance
resource "aws_instance" "ec2_instance" {
  ami                         = data.aws_ami.ami.id
  iam_instance_profile        = var.use_instance_profile ? var.instance_profile_name : null
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.existing_security_group_ids
  associate_public_ip_address = var.assign_public_ip
  key_name                    = var.uses_ssh ? var.keypair_name : null
  user_data                   = var.use_userdata ? file(var.userdata_script_path) : null
  user_data_replace_on_change = var.use_userdata ? var.user_data_replace_on_change : null

  tags = merge(
    {
      Name = var.instance_name
    },
    var.extra_tags
  )
}
