variable network {
  description = "Docker network name for the system"
  type        = string
}  

variable "platform_volume" {
  description = "Docker volume name for the database"
  type        = string
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
  type = number
}