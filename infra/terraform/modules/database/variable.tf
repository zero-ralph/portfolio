variable network {
  description = "Docker network name for the system"
  type        = string
}  

variable "platform_volume" {
  description = "Docker volume name for the database"
  type        = string
}

variable "temporal_db_volume" {
  description = "Temporal Database volume"
  type = string
}

variable "system_postgres_user" {
  description = "Postgres System User"
  type = string
}

variable "system_postgres_password" {
  description = "Postgres System Password"
  type = string
}

variable "system_postgres_db" {
  description = "Postgres System Database"
  type = string
}

variable "system_postgres_port" {
  description = "Postgres System Port"
  type = string
}

variable "temporal_db_port" {
  description = "Postgres Temporal Port"
  type = string
}

variable "temporal_db_user" {
  description = "Postgres Temporal User"
  type = string
}

variable "temporal_postgres_pwd" {
  description = "Postgre Temporal Password"
  type = string
}

variable "temporal_db_name" {
  description = "Postgres Temporal Database Name"
  type = string
}