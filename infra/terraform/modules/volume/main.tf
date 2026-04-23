resource "docker_volume" "platform_postgres_volume" {
  name = "platform_postgres_volume"
}

resource "docker_volume" "temporal_postgres_volume" {
  name = "temporal_postgres_volume"
}

resource "docker_volume" "localstack_volume" {
  name = "localstack_volume"
}