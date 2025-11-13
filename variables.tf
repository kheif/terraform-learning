variable "github_token" {
  description = "GitHub token (personal access token) with repo scope. Set via TF_VAR_github_token or environment." 
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.github_token) > 0
    error_message = "GitHub token cannot be empty."
  }
}

variable "github_owner" {
  description = "GitHub owner (username or org). If empty, the workflow will pass the repository owner." 
  type        = string
  default     = ""

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]*$", var.github_owner))
    error_message = "GitHub owner must contain only alphanumeric characters and hyphens."
  }
}

variable "repo_name" {
  description = "Optional repo name to create. If empty, a timestamped name will be generated." 
  type        = string
  default     = ""

  validation {
    condition     = var.repo_name == "" || can(regex("^[a-zA-Z0-9._-]+$", var.repo_name))
    error_message = "Repository name must contain only alphanumeric characters, periods, hyphens, and underscores."
  }
}
