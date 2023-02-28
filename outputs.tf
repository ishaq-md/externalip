# Output variable: Public IP address
output "ID" {
  value = google_compute_instance.vm_instance.id
}

output "INSTANCE_ID" {
  value = google_compute_instance.vm_instance.instance_id
}

output "SELF_LINK" {
  value = google_compute_instance.vm_instance.self_link
}
