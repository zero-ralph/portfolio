resource "docker_image" "platform_loki_image" {
  name = "grafana/loki:latest"
}

resource "docker_container" "platform_loki" {
  name  = "platform_loki"
  image = docker_image.platform_loki_image.name
  restart = "unless-stopped"

  ports {
    internal = 3100
    external = 3100
  }

  volumes {
    volume_name      = var.loki_volume
    container_path = "/loki"
  }

  healthcheck {
    test     = ["CMD-SHELL", "wget --no-verbose --tries=1 --spider http://localhost:3100/ready || exit 1"]
    interval = "10s"
  }

  labels {
    label = "com.docker.compose.project"
    value = "portfolio"
  }

  labels {
    label = "com.docker.compose.service"
    value = "platform_loki"
  }

  networks_advanced {
    name = var.network
  }
  
}