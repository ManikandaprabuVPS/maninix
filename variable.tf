variable "server_port" {
  description = "The port the server will use for HTTP requests"
default = 22
}
data "aws_availability_zones" "all" {}
