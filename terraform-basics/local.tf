resource "local_file" "pet" {
    filename = "root/local_examples/pet.txt"
    content = "We love pets"
}

resource "local_file" "pet_readonly" {
  filename = "root/local_examples/pet-readonly.txt"
  content = "We love pets and this file is read-only"
  file_permission = "0700"
}

resource "local_sensitive_file" "pet_local_sensitive_file" {
  filename = "root/local_examples/pet-sensitive.txt"
  content  = "We love pets, but this file is sensitive"
}