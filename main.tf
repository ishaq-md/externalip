provider "google" {
  credentials = file("terraform.json")
  project     = "mi-dev-env"

}

resource "null_resource" "gcloud_command" {
  provisioner "local-exec" {
    command = "gcloud compute instances list --format='value(name,networkInterfaces[0].accessConfigs[0].natIP)' --filter='status=RUNNING'"
  }
}
