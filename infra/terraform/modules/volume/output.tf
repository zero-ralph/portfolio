output "platform_volume_name" {
  value = docker_volume.platform_postgres_volume.name
}
output "temporal_db_volume_name" {
  value = docker_volume.temporal_postgres_volume.name
}

output "localstack_volume_name" {
  value = docker_volume.localstack_volume.name
}