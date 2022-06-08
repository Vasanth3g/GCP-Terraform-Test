# allow http traffic
resource "google_compute_firewall" "allow-http" {
  name = "fw-allow-http"
  network = "https://www.googleapis.com/compute/v1/projects/true-loader-349707/global/networks/default"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]

}
