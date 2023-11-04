terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
  }

  provider "yandex" {
    token     = "y0_AgAAAABxjvfaAATuwQAAAADwGs-6LBb1S43rSiuiQZKQroJT3wP1CaU"
    cloud_id  = "b1gep01krptc15obs9q9"
    folder_id = "b1gtu89ljuktik0kfuk2"
    zone      = "ru-central1-a"
  }

resource "yandex_compute_instance" "db" {
  name = "reddit-db"
  labels = {
    tags = "reddit-db"
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
}
