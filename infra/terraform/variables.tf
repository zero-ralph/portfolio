variable "system_postgres_user" {
  description = "Postgres user for the system database"
  type        = string
}

variable "system_postgres_password" {
  description = "Postgres password for the system database"
  type        = string
  sensitive   = true
} 

variable "system_postgres_db" {
  description = "Postgres database name for the system database"
  type        = string
}

variable "system_postgres_port" {
  description = "Postgres port for the system database"
  type        = string
}

variable "system_localstack_auth" {
  description = "Auth token for LocalStack"
  type        = string
  sensitive   = true
}

variable "system_docker_host" {
  description = "Docker host for the system"
  type        = string
}

variable "system_azure_client_id" {
  description = "Azure client ID for the system"
  type        = string
}

variable "system_azure_client_secret" {
  description = "Azure client secret for the system"
  type        = string
  sensitive   = true
}

variable "system_azure_tenant_id" {
  description = "Azure tenant ID for the system"
  type        = string
}

variable "system_azure_subscription_id" {
  description = "Azure subscription ID for the system"
  type        = string
}

variable "system_debug" {
  description = "Enable debug mode for the system"
  type        = string
}

variable "temporal_postgres_seeds" {
  description = "Comma-separated list of Temporal Postgres seeds"
  type        = string
}

variable "temporal_postgres_user" {
  description = "Postgres user for Temporal"
  type        = string
}

variable "temporal_postgres_password" {
  description = "Postgres password for Temporal"
  type        = string
  sensitive   = true
}

variable "temporal_postgres_db" {
  description = "Postgres database name for Temporal"
  type        = string
}

variable "temporal_postgres_pwd" {
  description = "Postgres password for Temporal (alternative variable name)"
  type        = string
  sensitive   = true
}

variable "temporal_db" {
  description = "Database name for Temporal"
  type        = string
}

variable "temporal_db_port" {
  description = "Database port for Temporal"
  type        = string
}

variable "temporal_db_host" {
  description = "Database host for Temporal"
  type        = string
}

variable "temporal_address" {
  description = "Address for Temporal"
  type        = string
}
