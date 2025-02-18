variable "prefix" {
  description = "Prefix for resources in AWS"
  default     = "raa"
}

variable "project" {
  description = "Project name for tagging resources"
  default     = "recipe-app-api"
}

variable "contact" {
  description = "Contact email for tagging resources"
  default     = "harriajames97@gmail.com"
}

variable "db_username" {
  description = "Username for the recipe app api database"
  default     = "recipeapp"
}

variable "db_password" {
  description = "Password for the Terraform database"
  default     = "ValidPassword123!"

}

variable "ecr_proxy_image" {
  description = "Path to the ECR repo with the proxy image"
  default     = "253490748905.dkr.ecr.eu-north-1.amazonaws.com/recipe-app-api-proxy"
}

variable "ecr_app_image" {
  description = "Path to the ECR repo with the API image"
  default     = " 253490748905.dkr.ecr.eu-north-1.amazonaws.com/recipe-app-api-app"
}

variable "django_secret_key" {
  description = "Secret key for Django"
}
