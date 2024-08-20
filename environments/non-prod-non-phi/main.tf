provider "google" {
  project = "your-project-id"
  region  = "your-region"
}

module "cloud_sql" {
  source                 = "./modules/cloud_sql"
  project_id             = var.project_id
  region                 = "us-central1"
  instance_name          = var.instance_name
  database_version       = var.database_version
  tier                   = var.tier
}

module "database-instance" {
  source                    = "./modules/database-instance"
  project_id                = var.project_id
  region                    = "us-central1"
  instance_name             = var.instance_name
  database_name             = var.database_name
  user_name                 = var.user_name
  user_password             = var.user_password # or use a random_password if you don't want to specify
  secret_manager_namespace  = var.secret_manager_namespace
}