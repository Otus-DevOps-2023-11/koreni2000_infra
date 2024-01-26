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
variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
variable "subnet_id" {
  type = string
}
