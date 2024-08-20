output "instance_connection_name" {
  description = "The connection name of the Cloud SQL instance"
  value       = google_sql_database_instance.instance.connection_name
}

output "database_name" {
  description = "The name of the created database"
  value       = google_sql_database.database.name
}

output "user_name" {
  description = "The name of the created user"
  value       = google_sql_user.user.name
}

output "secret_id" {
  description = "The ID of the secret storing the user password"
  value       = google_secret_manager_secret.db_password_secret.id
}
