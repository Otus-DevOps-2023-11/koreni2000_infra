variable "env" {
  type = string
}
variable "public_key_path" {
  # Описание переменной
  type = string
  description = "Path to the public key used for ssh access"
}
variable "private_key_path" {
  type = string
  description = "Path to the private key file"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}
variable "subnet_id" {
  type = string
}
variable "database_url" {
  type = string
}
