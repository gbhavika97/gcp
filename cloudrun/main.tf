resource "google_cloud_run_service" "cloudrun-with-tf" {
    name = "cloudrun-with-tf"
    location = "us-west4"

    template {
      spec {
        containers {
          image = "gcr.io/google-samples/hello-app:1.0"
        }
      }
    }
  
}

data "google_iam_policy" "pubaccess" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "pubaccess" {
  location    = google_cloud_run_service.cloudrun-with-tf.location
  project     = google_cloud_run_service.cloudrun-with-tf.project
  service     = google_cloud_run_service.cloudrun-with-tf.name

  policy_data = data.google_iam_policy.pubaccess.policy_data
}
