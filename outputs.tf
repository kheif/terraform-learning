// Oluşturulan repository'nin adını çıktı olarak verir.
output "repo_name" {
  description = "Name of the created repository"
  value       = github_repository.new.name
}

// Oluşturulan repository'nin web (HTML) URL'sini çıktı olarak verir.
output "repo_html_url" {
  description = "HTML URL of the created repository"
  value       = github_repository.new.html_url
}
