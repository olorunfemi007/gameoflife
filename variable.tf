variable "ami" {
  type    = string
  default = "ami-04b70fa74e45c3917"

}

variable "instance_type" {
  type = list(string)
  default = ["t2.micro", "t2.small", "t2.medium", "t2.large"]
}

variable "cluster-name" {
  type = string
  default = "java_app_cluster"
}

variable "key_pair" {
  type = string
  default = "vpc_east1"
}

variable "region" {
  type = string
  default = "us-east-1"
}
