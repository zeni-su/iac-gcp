data "google_project" "this" {
  project_id = var.project_id
}

provider "google" {
  project = var.project_id
}

resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"
}

resource "google_firestore_database" "this" {
  name        = "(default)"
  location_id = "europe-west1"
  type        = "FIRESTORE_NATIVE"

  depends_on = [
    google_project_service.firestore
  ]
}
