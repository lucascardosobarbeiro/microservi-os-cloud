
provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_artifact_registry_repository" "docker_repo" {
  provider = google
  location      = var.region
  repository_id = var.repo_name
  description   = "Docker repository"
  format        = "DOCKER"
}

resource "google_container_cluster" "autopilot_cluster" {
  name     = var.cluster_name
  location = var.region
  enable_autopilot = true
}
