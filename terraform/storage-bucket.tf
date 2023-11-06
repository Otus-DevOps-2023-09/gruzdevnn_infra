
 resource "yandex_storage_bucket" "terraform-storage" {
  bucket        = "gruzdevcloud"
  access_key    = var.access_key
  secret_key    = var.secret_key
  force_destroy = "true"
}
