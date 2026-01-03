resource "local_file" "pet" {
    filename = var.filename
    content = var.content
}

resource "local_file" "pet_readonly" {
  filename = "root/pets-readonly.txt"
  content = "We love pets and this file is read-only"
  file_permission = "0700"
}

resource "local_sensitive_file" "pet_local_sensitive_file" {
  filename = "root/pets-sensitive.txt"
  content  = "We love pets, but this file is sensitive"
}