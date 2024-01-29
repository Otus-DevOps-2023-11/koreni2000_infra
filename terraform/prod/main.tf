# terraform {
#   required_providers {
#     yandex = {
#       source = "yandex-cloud/yandex"
#       # version = "0.104.0"
#     }
#   }
# }

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone

}

module "db" {
  source           = "../modules/db"
  env              = var.env
  private_key_path = var.private_key_path
  public_key_path  = var.public_key_path
  db_disk_image    = var.db_disk_image
  subnet_id        = var.subnet_id
}

module "app" {
  source           = "../modules/app"
  env              = var.env
  depends_on       = [module.db]
  private_key_path = var.private_key_path
  public_key_path  = var.public_key_path
  app_disk_image   = var.app_disk_image
  subnet_id        = var.subnet_id
  database_url     = module.db.internal_ip_address_db
}
