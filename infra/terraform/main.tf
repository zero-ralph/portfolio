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
    temporal_db_volume = module.volume.temporal_db_volume_name

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

  depends_on = [module.database.temporal_postgres_name]
}

module "localstack" {
  source = "./modules/localstack"
  azure_client_id = var.system_azure_client_id
  azure_client_secret = var.system_azure_client_secret
  azure_tenant_id = var.system_azure_tenant_id
  azure_subscription_id = var.system_azure_subscription_id
  azure_debug = var.system_debug
  azure_localstack_auth_token = var.system_localstack_auth
  localstack_volume = module.volume.localstack_volume_name
  network = module.network.network_name
}