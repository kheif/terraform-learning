resource "local_file" "pet" {
    filename = var.filename[0]
    content = var.file-content["statement1"]
}

resource "local_file" "pet_readonly" {
  filename = var.filename[1]
  content = var.file-content["statement2"]
  file_permission = var.file-permission["read-only"]
}

resource "local_sensitive_file" "pet_local_sensitive_file" {
  filename = var.filename[2]
  content  = var.file-content["statement3"]
}

resource "random_pet" "my_pet" {
  prefix = var.prefix[0]
  separator = var.separator
  length    = var.length
  
}