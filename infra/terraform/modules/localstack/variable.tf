variable "azure_client_id" {
  description = "Azure Client Id"
  type = string
}

variable "azure_client_secret" {
  description = "Azure Client Secret"
  type = string
}

variable "azure_tenant_id" {
  description = "Azure Tenant Id"
  type = string
}

variable "azure_subscription_id" {
    description = "Azure Subscription Id"
    type = string
}

variable "azure_debug" {
    description = "Enable debug mode for Azure LocalStack"
    type = string
}

variable "azure_localstack_auth_token" {
  description = "LocalStack Auth Token"
  type = string
}

variable "localstack_volume" {
    description = "Docker volume for LocalStack"
    type = string
}

variable "network" {
  description = "Docker network name for the system"
  type        = string
}