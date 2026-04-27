resource "docker_image" "prometheus_image" {
  name = "prom/prometheus:latest" 
}


resource "docker_container" "platform_prometheus" {
    name  = "platform-prometheus" 
    image = docker_image.prometheus_image.name
    restart = "unless-stopped"

    ports {
        internal = 9090
        external = 9090
    }

    volumes {
        host_path      = "${path.module}/prometheus.yml"
        container_path = "/etc/prometheus/prometheus.yml"
    }

    labels {
        label = "com.docker.compose.project"
        value = "portfolio"
    }
    labels {
        label = "com.docker.compose.service"
        value = "platform-prometheus"
    }
}