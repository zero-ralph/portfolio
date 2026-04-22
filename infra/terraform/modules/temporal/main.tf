resource "docker_image" "temporal_image" {
  name = "temporalio/auto-setup:latest"
}

resource "docker_container" "platform_temporal" {
  name  = "platform_temporal"
  image = docker_image.temporal_image.name
  restart = "unless-stopped"

  env = [
    "DB=${var.temporal_postgres_db}",
    "DB_PORT=${var.temporal_postgres_port}",
    "DB_HOST=${var.temporal_postgres_host}",
  ]


  ports {
    internal = 7233
    external = 7233
  }

  #     depends_on = [docker_container.temporal_postgres]
  
  healthcheck {
    test = ["CMD-SHELL", "tctl --address 127.0.0.1:7233 cluster health || exit 1"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }

  labels {
    label = "com.docker.compose.project"
    value = "portfolio"
  }
  labels {
    label = "com.docker.compose.service"
    value = "platform_temporal"
  }
}