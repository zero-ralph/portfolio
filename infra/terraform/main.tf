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

}