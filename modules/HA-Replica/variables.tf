
variable "project_id" {
  type        = string
  description = "The ID of the GCP project"
}
variable "region" {
  type        = string
  description = "The region where the Cloud SQL instance will be created"
}

variable "db_version" {
  type        = string
  description = "The version of MySQL to use"
  default     = "MYSQL_5_7"
}

variable "db_tier" {
  type        = string
  description = "The machine type to use for the instance"
}

variable "instance_name" {
  type        = string
  description = "Name of the database to create"
}


variable "allowed_consumer_projects" {
  type        = list(string)
  description = "List of allowed consumer projects for PSC"
}

variable "read_replica_regions" {
  type        = list(string)
  description = "regions for the read replica"
}

