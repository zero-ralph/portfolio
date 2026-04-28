resource "docker_image" "api_gateway_image" {
  name = "local_api:latest"
}

resource "docker_container" "api_gateway" {
  name = "local_api"
  image = docker_image.api_gateway_image.image_id

  ports {
    internal = 1233
    external = 1233
  }

  labels {
    label = "com.docker.compose.project"
    value = "portfolio"
  }

  labels {
    label = "com.docker.compose.service"
    value = "local_api"
  }

    networks_advanced {
        name = var.network
    }
}