
############################################
# Actual OVH Database Service
############################################

resource "ovh_cloud_project_database" "this" {

  service_name = var.database_service_name
  description  = var.database_description
  engine  = var.database_engine
  version = var.database_version
  plan    = var.database_plan
  flavor  = var.database_flavor

  deletion_protection = var.database_deletion_protection

  disk_size           = var.database_disk_size

  backup_regions   = var.database_backup_regions
  backup_time      = var.database_backup_time

  maintenance_time = var.database_maintenance_time

  advanced_configuration = var.database_advanced_configuration

  kafka_rest_api        = var.database_kafka_rest_api
  kafka_schema_registry = var.database_kafka_schema_registry
  
  opensearch_acls_enabled = var.database_opensearch_acls_enabled

  ##############################
  # Nodes
  ##############################
  dynamic "nodes" {
    for_each = var.database_nodes
    content {
      region     = nodes.value.region
      network_id = nodes.value.network_id
      subnet_id  = nodes.value.subnet_id
    }
  }

  ##############################
  # IP Restrictions
  ##############################
  dynamic "ip_restrictions" {
    for_each = var.ip_restrictions
    content {
      ip          = ip_restrictions.value.ip
      description = lookup(ip_restrictions.value, "description", null)
    }
  }
}
