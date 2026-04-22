module "network" {
    source = "./modules/network" 
}

module "volume" {
    source = "./modules/volume"
}

module "database" {
    source = "./modules/database"
    network = module.network.network_name
    platform_volume = module.volume.platform_volume_name
    system_postgres_user = var.system_postgres_user
    system_postgres_password = var.system_postgres_password
    system_postgres_db = var.system_postgres_db
    system_postgres_port = var.system_postgres_port
    temporal_db_port = var.temporal_db_port
    temporal_db_user = var.temporal_postgres_user
    temporal_postgres_pwd = var.temporal_postgres_pwd
    temporal_db_name = var.temporal_postgres_db
}

module "temporal" {
  source = "./modules/temporal"
  temporal_postgres_db = var.temporal_db
  temporal_postgres_host = var.temporal_db_host
  temporal_postgres_port = var.temporal_db_port
}