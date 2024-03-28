variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}

variable "AWS_REGION" {
  type = string
}

variable "most_recent_ami" {
  type = bool
}

variable "owners" {
  type    = list(string)
  default = ["amazon"]
}

variable "ami_name_filter" {
  type    = string
  default = "name"
}

variable "ami_values_filter" {
  type    = list(string)
  default = ["al2023-ami-2023.*-x86_64"]
}

variable "use_instance_profile" {
  type    = bool
  default = false
}

variable "instance_profile_name" {
  type = string
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "assign_public_ip" {
  type    = bool
  default = true
}

variable "extra_tags" {
  description = "Additional tags for EC2 instances"
  type        = map(string)
  default     = {}
}

variable "existing_security_group_ids" {
  description = "security group IDs for EC2 instances"
  type        = list(string)
}

variable "uses_ssh" {
  type = bool
}

variable "keypair_name" {
  type = string
}
variable "use_userdata" {
  description = "Whether to use userdata"
  type        = bool
  default     = false
}

variable "userdata_script_path" {
  description = "Path to the userdata script"
  type        = string
}

variable "user_data_replace_on_change" {
  type = bool
}
