#terraform {
  #required_providers {
    #yandex = {
      #source = "yandex-cloud/yandex"
    #}
  #}
  #required_version = ">= 0.13"
  #}

  provider "yandex" {
    service_account_key_file = var.service_account_key_file
    cloud_id  = var.cloud_id
    folder_id = var.folder_id
    zone      = var.zone
  }
resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  labels = {
    tags = "reddit-app"
  }
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = "e9b6novi7vdmhr9geb99"
    nat       = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
