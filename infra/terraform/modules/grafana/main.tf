resource "docker_image" "grafana_image" {
  name = "grafana/grafana:latest"
}

resource "docker_container" "platform_grafana" {
  name  = "platform_grafana"
  image = docker_image.grafana_image.name
  restart = "unless-stopped"

  ports {
    internal = 3000
    external = 3000
  }

  env = [
    "GF_SECURITY_ADMIN_USER=${var.grafana_username}",
    "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_password}"
  ]

  volumes {
    volume_name      = var.grafana_volume
    container_path = "/var/lib/grafana/"
  }

  labels {
    label = "com.docker.compose.project"
    value = "portfolio"
  }
  labels {
    label = "com.docker.compose.service"
    value = "platform_grafana"
  }
}