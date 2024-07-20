terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

provider "google" {

}

resource "google_workbench_instance" "instance" {
  name = "workbench-instance"
  location = "us-west1-a"

  gce_setup {
    container_image {
      repository = "us-docker.pkg.dev/deeplearning-platform-release/gcr.io/base-cu113.py310"
      tag = "latest"
    }
  }
}