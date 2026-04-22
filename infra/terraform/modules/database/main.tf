resource "docker_image" "postgres" {
    name         = "postgres:latest"
    keep_locally = true
}

resource "docker_container" "platform_postgres" {
    image       = docker_image.postgres.image_id
    
    name        = "platform_postgres"
    restart     = "unless-stopped"

    networks_advanced {
        name = var.network
    }

    ports {
        internal = 5432
        external = var.system_postgres_port
    }

    volumes {
        volume_name      = var.platform_volume
        container_path = "/var/lib/postgresql/"
    }

    env = [
        "POSTGRES_USER=${var.system_postgres_user}",
        "POSTGRES_PASSWORD=${var.system_postgres_password}",
        "POSTGRES_DB=${var.system_postgres_db}"
    ]

    healthcheck {
        test     = ["CMD-SHELL", "pg_isready -U ${var.system_postgres_user} -d ${var.system_postgres_db} -p ${var.system_postgres_port} || exit 1"]
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
        value = "platform_postgres"
    }
}

resource "docker_container" "temporal_postgres" {
    image       = docker_image.postgres.image_id
    
    name        = "temporal_postgres"
    restart     = "unless-stopped"

    networks_advanced {
        name = var.network
    }

    ports {
        internal = 5432
        external = var.temporal_db_port
    }

    env = [
        "POSTGRES_USER=${var.temporal_db_user}",
        "POSTGRES_PASSWORD=${var.temporal_postgres_pwd}",
        "POSTGRES_DB=${var.temporal_db_name}"
    ]

    healthcheck {
        test     = ["CMD-SHELL", "pg_isready -U ${var.temporal_db_user} -d ${var.temporal_db_name} -p ${var.temporal_db_port} || exit 1"]
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
        value = "temporal_postgres"
    }
  
}