provider "google" {
  project     = "true-loader-349707"
  region      = "asia-south2"
  credentials = file("../auth/gcp_admin.json")
}

provider "google-beta" {
  project     = "true-loader-349707"
  region      = "asia-south2"
  credentials = file("../auth/gcp_admin.json")
}
