output "platform_postgres_name" {
  value = docker_container.platform_postgres.name
}

output "temporal_postgres_name" {
  value = docker_container.temporal_postgres.name
}