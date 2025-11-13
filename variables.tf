// `github_token`: GitHub API'ine erişim için kullanılan kişisel erişim token'ı (PAT).
// Bu değer sensitive olarak işaretlendi; workflow'ta secret üzerinden verilir.
variable "github_token" {
  description = "GitHub token (personal access token) with repo scope. Set via TF_VAR_github_token or environment." 
  type        = string
  sensitive   = true
}

// `github_owner`: Oluşturulacak repoların sahibi (kullanıcı veya organizasyon).
// Eğer boş bırakılırsa workflow `github.repository_owner` değerini geçirir.
variable "github_owner" {
  description = "GitHub owner (username or org). If empty, the workflow will pass the repository owner." 
  type        = string
  default     = ""
}

// `repo_name`: Opsiyonel; eğer sağlanırsa belirlenen isimle repo oluşturulur.
// Sağlanmazsa `main.tf` timestamp'li bir isim üretir ve böylece her run yeni repo yapar.
variable "repo_name" {
  description = "Optional repo name to create. If empty, a timestamped name will be generated." 
  type        = string
  default     = ""
}
