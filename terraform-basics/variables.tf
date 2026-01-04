variable "filename" {
  type = list(string)
  description = "the path of local file"
}
variable "file-content" {
  type = map(string)
  description = "the content of the file"
}
variable "file-permission" {
  type = map(string)
  description = "the permission of the file"
}
variable "prefix" {
  type = list(string)
  description = "list of prefixes"
}
variable "separator" {
  type = string
  description = "the separator between prefix and name"
}
variable "length" {
  type = number
  description = "length of the pet name"
}