resource "google_compute_network" "vpc" {
    name = var.vpc-name
    auto_create_subnetworks = false
  
}
resource "google_compute_subnetwork" "subnet-1" {
    name = var.subnet
    region = var.region
    network = google_compute_network.vpc.name
    ip_cidr_range = var.ip_cidr_range
  
}
resource "google_compute_instance" "vm_instance" {
    name = var.vm-name
    machine_type = var.machine_type
    tags = [ "ssh","http-server" ,"https-server"]
    boot_disk {
      initialize_params {
        image = var.image
      }
    }


    network_interface {
      network = google_compute_network.vpc.self_link
      subnetwork = google_compute_subnetwork.subnet-1.self_link
      access_config {
        
      }
    }
  
}
