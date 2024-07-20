resource "google_storage_bucket" "demo-storage" {
    name = var.bucket-name
    location = var.region
    force_destroy = true

    uniform_bucket_level_access = true


    lifecycle_rule {
      condition {
        age = 3
      }
      action {
        type = "SetStorageClass"
        storage_class = "REGIONAL"
      }
    }

    versioning {
      enabled = false
    }



  
}