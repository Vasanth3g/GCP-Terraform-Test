
/*
resource "google_service_account" "default" {
  account_id   = "105012685710168203195"
  display_name = "Service Account"
}
*/

resource "google_compute_instance" "web-server-1" {
  name         = "test-vm-1"
  machine_type = "e2-micro"
  zone         = "asia-south2-a"

  tags = ["http"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

 /* // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }
*/
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    test = "Webserver1"
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential apache2; sudo echo Hello World > /var/www/html/index.html"
/*
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
*/
}




resource "google_compute_instance" "web-server-2" {
  name         = "test-vm-2"
  machine_type = "e2-micro"
  zone         = "asia-south2-a"

  tags = ["http"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

 /* // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }
*/
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    test = "Webserver2"
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential apache2; sudo echo Hello World > /var/www/html/index.html"
}