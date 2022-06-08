resource "google_compute_instance_group" "webservers" {
  name        = "terraform-webservers"
  description = "Terraform test instance group"

  instances = [
    google_compute_instance.web-server-1.id,
    google_compute_instance.web-server-2.id,
  ]

  named_port {
    name = "http"
    port = "80"
  }

  zone = "asia-south2-a"
}