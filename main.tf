// Terraform blok: hangi provider'ların gerektiğini ve Terraform sürümü gereksinimini belirtir.
// Bu blok Terraform'un çalışma zamanı ve provider sürüm uyumluluğunu sağlar.
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    github = {
      source  = "hashicorp/github"
      version = "~> 4.0"
    }
  }
}

// Provider konfigürasyonu: GitHub ile konuşmak için gerekli token ve owner bilgisi burada verilir.
// `token` sensitive bilgidir; workflow içinde secret olarak sağlanır.
provider "github" {
  token = var.github_token
  owner = var.github_owner
}

// Locals: repo ismi için kullanılacak mantık burada. Eğer kullanıcı `repo_name` vermediyse
// timestamp içeren benzersiz bir isim üretilir. Bu sayede her run farklı bir repo yaratır.
locals {
  # Kullanıcı `repo_name` verirse onu kullan; yoksa timestamp ile benzersiz isim oluştur.
  repo_name = var.repo_name != "" ? var.repo_name : "auto-repo-${formatdate("YYYYMMDDHHMMSS", timestamp())}"
}

// Kaynak: GitHub üzerinde yeni bir repository oluşturur.
// Burada visibility private olarak ayarlandı; ayrıca issue/wiki gibi özellikler konfigüre edilebilir.
resource "github_repository" "new" {
  name        = local.repo_name
  description = "Private repo created by Terraform from GitHub Actions"
  visibility  = "private"
  has_issues   = true
  has_projects = false
  has_wiki     = false
}
