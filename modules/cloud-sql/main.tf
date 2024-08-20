resource "google_sql_database_instance" "instance" {
  name             = var.instance_name
  project          = var.project_id
  region           = var.region
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"
    backup_configuration {
      enabled = true
    }
  }
  deletion_protection = false 
}

resource "google_sql_database" "database" {
  name     = var.database_name
  project          = var.project_id
  instance = google_sql_database_instance.instance.name
}

resource "random_password" "password" {
  length  = 16
  special = true
}

resource "google_sql_user" "user" {
  name     = var.user_name
  project  = var.project_id
  instance = google_sql_database_instance.instance.name
  password = var.user_password != "" ? var.user_password : random_password.password.result
}

resource "google_secret_manager_secret" "db_password_secret" {
  secret_id     = "${var.secret_manager_namespace}-${var.instance_name}-${var.user_name}-db-password"
  project  = var.project_id
  replication {
    auto{}
  }
}

resource "google_secret_manager_secret_version" "db_password_secret_version" {
  secret      = google_secret_manager_secret.db_password_secret.id
  secret_data = google_sql_user.user.password
}