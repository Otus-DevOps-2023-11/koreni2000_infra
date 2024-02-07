terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      # version = "0.104.0"
    }
  }
}

resource "yandex_compute_instance" "db" {
  name = "reddit-db-${var.env}"
  labels = {
    tags = "reddit-db-${var.env}"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
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

  # provisioner "remote-exec" {
  #   script = "../modules/db/files/db.sh"
  # }
}
