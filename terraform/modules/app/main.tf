terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      # version = "0.104.0"
    }
  }
}

resource "yandex_compute_instance" "app" {
#   count = 1
  name = "reddit-app-${var.env}"
  labels = {
    tags = "reddit-app-${var.env}"
  }
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашнем задании
      image_id = var.app_disk_image
    }
  }
  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet_id
    nat = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  # connection {
  #   type  = "ssh"
  #   host  = self.network_interface.0.nat_ip_address
  #   user  = "ubuntu"
  #   agent = false
  #   # путь до приватного ключа
  #   private_key = file(var.private_key_path)
  # }
  # provisioner "file" {
  #   source      = "../modules/app/files/puma.service"
  #   destination = "/tmp/puma.service"
  # }
  # provisioner "file" {
  #   source      = "../modules/app/files/deploy.sh"
  #   destination = "/tmp/deploy.sh"
  # }
  # provisioner "remote-exec" {
  #   inline = [
  #       "#!/bin/bash",
  #       "cd /tmp/",
  #       "touch /tmp/db_server",
  #       "echo 'DATABASE_URL=${var.database_url}' >> /tmp/db_server",
  #       "sudo chmod +x deploy.sh",
  #       "./deploy.sh"
  #   ]
  # }
}
