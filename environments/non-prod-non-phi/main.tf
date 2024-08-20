provider "google" {
  project = "your-project-id"
  region  = "your-region"
}

module "cloud_sql" {
  source                 = "./modules/cloud_sql"
  project_id             = "your-project-id"
  instance_name          = "my-sql-instance"
  database_name          = "my-database"
  user_name              = "db-user"
  user_password          = "super-secret-password" # or use a random_password if you don't want to specify
  region                 = "us-central1"
  secret_manager_namespace = "your-namespace"
}