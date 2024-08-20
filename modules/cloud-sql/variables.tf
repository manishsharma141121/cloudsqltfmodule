variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
}

variable "database_name" {
  description = "The name of the database"
  type        = string
}

variable "user_name" {
  description = "The username for the database"
  type        = string
}

variable "user_password" {
  description = "The password for the database user"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "secret_manager_namespace" {
  description = "Namespace for storing secrets in Secret Manager"
  type        = string
}