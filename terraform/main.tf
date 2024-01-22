terraform {
  required_version = ">= 0.13"
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      # version = "0.94.0"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "app" {
  source = "./modules/app"
  private_key_path = var.private_key_path
  public_key_path = var.public_key_path
  app_disk_image = var.app_disk_image
}

module "db" {
  source = "./modules/db"
  private_key_path = var.private_key_path
  public_key_path = var.public_key_path
  db_disk_image = var.db_disk_image
}
