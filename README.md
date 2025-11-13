Terraform + GitHub Actions: auto-create private repos

Türkçe özet: Bu repo, GitHub Actions ile zamanlanmış olarak çalışan ve her çalıştırmada GitHub üzerinde yeni bir özel repository oluşturan küçük bir Terraform örneğidir.

What this repo contains
- A minimal Terraform configuration to create a GitHub repository: `main.tf`, `variables.tf`, `outputs.tf`.
- A GitHub Actions workflow `.github/workflows/create-repo.yml` that runs on a schedule (every 10 minutes) and applies the Terraform config.

How it works
- The workflow injects your personal access token (PAT) via the `GH_PAT` secret into `TF_VAR_github_token` so Terraform can talk to the GitHub API.
- If you do not pass `repo_name`, Terraform will generate a timestamped name so each run creates a unique private repository.

Önemli: Secret oluşturma (Türkçe)
1. GitHub'da bir kişisel erişim token'ı (PAT) oluşturun. Kullanıcı repoları için `repo` scope'u yeterlidir; organizasyon altı repo veya yönetim gereksinimleri için ek scope'lar gerekebilir.
2. Bu repoda Settings → Secrets and variables → Actions yoluna gidip yeni bir repository secret oluşturun ve adını `GH_PAT` yapın. Değer olarak oluşturduğunuz PAT'i verin.

Notes and cautions
- The workflow will create a new private repo every 10 minutes. That can quickly clutter your account.
- Consider adding a cleanup step or using a naming pattern to identify and remove test repos later.
- The GitHub Actions cron schedule uses UTC.

Nasıl yerelde test edilir (PowerShell örneği)
1. Terraform 1.0+ kurun.
2. PowerShell'de environment değişkenleri ayarlayın:
```powershell
$env:TF_VAR_github_token = "<YOUR_PAT>"
$env:TF_VAR_github_owner = "<YOUR_GITHUB_USER_OR_ORG>"
```
3. Ardından:
```powershell
terraform init
terraform apply -auto-approve
```

Uyarı: Workflow cron ile otomatik çalıştığı için çok sayıda repo oluşmasını istemiyorsanız schedule'ı değiştirin veya cleanup mekanizması ekleyin.
