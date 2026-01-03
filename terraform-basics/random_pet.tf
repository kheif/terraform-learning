resource "random_pet" "my_pet" {
  prefix = var.prefix
  separator = var.separator
  length    = var.length
  
}