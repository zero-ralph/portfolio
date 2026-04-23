resource "docker_image" "localstack_azure_image" {
  name = "localstack/localstack-azure-alpha"
}

resource "docker_container" "platform_localstack" {
  name  = "platform_localstack"
  image = docker_image.localstack_azure_image.name
  restart = "unless-stopped"

  env = [
    "AZURE_CLIENT_ID=${var.azure_client_id}",
    "AZURE_CLIENT_SECRET=${var.azure_client_secret}",
    "AZURE_TENANT_ID=${var.azure_tenant_id}",
    "AZURE_SUBSCRIPTION_ID=${var.azure_subscription_id}",
    "DEBUG=${var.azure_debug}",
    "LOCALSTACK_AUTH_TOKEN=${var.azure_localstack_auth_token}"
  ]

  networks_advanced {
    name = var.network
  }

  volumes {
    volume_name      = var.localstack_volume
    container_path = "/var/lib/localstack/"
  }

  ports {
    internal = 4566
    external = 4566
  }


  labels {
    label = "com.docker.compose.project"
    value = "portfolio"
  }
  labels {
    label = "com.docker.compose.service"
    value = "platform_localstack"
  }
}