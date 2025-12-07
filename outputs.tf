###########################################
# IDENTITY & GENERAL INFORMATION
###########################################

output "id" {
  description = "Public Cloud Database Service ID"
  value       = ovh_cloud_project_database_service.this.id
}

output "service_name" {
  description = "OVH Cloud Project service name"
  value       = ovh_cloud_project_database_service.this.service_name
}

output "description" {
  description = "Description of the database service"
  value       = ovh_cloud_project_database_service.this.description
}

output "engine" {
  description = "Database engine type"
  value       = ovh_cloud_project_database_service.this.engine
}

output "version" {
  description = "Engine version"
  value       = ovh_cloud_project_database_service.this.version
}

output "plan" {
  description = "Cluster plan (essential, business, enterprise, etc.)"
  value       = ovh_cloud_project_database_service.this.plan
}

output "status" {
  description = "Current status of the cluster"
  value       = ovh_cloud_project_database_service.this.status
}

output "created_at" {
  description = "Creation date of the cluster"
  value       = ovh_cloud_project_database_service.this.created_at
}

###########################################
# NETWORK & NODES
###########################################

output "network_type" {
  description = "Type of network (public/private)"
  value       = ovh_cloud_project_database_service.this.network_type
}

output "nodes" {
  description = "List of nodes composing the cluster"
  value       = ovh_cloud_project_database_service.this.nodes
}

# Helper outputs for easier consumption :
output "node_regions" {
  description = "List of all regions used by nodes"
  value       = [for n in ovh_cloud_project_database_service.this.nodes : n.region]
}

output "node_network_ids" {
  description = "List of network IDs used by nodes"
  value       = [for n in ovh_cloud_project_database_service.this.nodes : n.network_id]
}

output "node_subnet_ids" {
  description = "List of subnet IDs used by nodes"
  value       = [for n in ovh_cloud_project_database_service.this.nodes : n.subnet_id]
}

###########################################
# ENDPOINTS (BEST PART)
###########################################

output "endpoints" {
  description = "Full list of endpoints for the database (uri, port, scheme, SSL settings...)"
  value       = ovh_cloud_project_database_service.this.endpoints
}

# Helper output: list of URIs only
output "uris" {
  description = "List of connection URIs"
  value       = [for e in ovh_cloud_project_database_service.this.endpoints : e.uri]
}

# Helper: endpoint info grouped by component/type
output "endpoints_by_component" {
  description = "Endpoints grouped by component (reader, writer, opensearch-dashboards, etc.)"
  value = {
    for e in ovh_cloud_project_database_service.this.endpoints :
    e.component => e
  }
}

###########################################
# DISK
###########################################

output "disk_size" {
  description = "Disk size in GB"
  value       = ovh_cloud_project_database_service.this.disk_size
}

output "disk_type" {
  description = "Type of disk used by the cluster (e.g., SSD)"
  value       = ovh_cloud_project_database_service.this.disk_type
}

###########################################
# BACKUPS & MAINTENANCE
###########################################

output "backup_regions" {
  description = "List of regions where backups are stored"
  value       = ovh_cloud_project_database_service.this.backup_regions
}

output "backup_time" {
  description = "The time of the daily backup (if applicable)"
  value       = ovh_cloud_project_database_service.this.backup_time
}

output "maintenance_time" {
  description = "Daily maintenance window start time"
  value       = ovh_cloud_project_database_service.this.maintenance_time
}

###########################################
# SECURITY
###########################################

output "deletion_protection" {
  description = "Indicates whether deletion protection is enabled"
  value       = ovh_cloud_project_database_service.this.deletion_protection
}

output "ip_restrictions" {
  description = "List of active IP restrictions"
  value       = ovh_cloud_project_database_service.this.ip_restrictions
}

output "allowed_ips" {
  description = "Just the list of allowed IPs"
  value       = [for r in ovh_cloud_project_database_service.this.ip_restrictions : r.ip]
}

###########################################
# ENGINE-SPECIFIC FLAGS
###########################################

output "kafka_rest_api" {
  description = "Defines whether Kafka REST API is enabled"
  value       = ovh_cloud_project_database_service.this.kafka_rest_api
}

output "kafka_schema_registry" {
  description = "Defines whether Kafka Schema Registry is enabled"
  value       = ovh_cloud_project_database_service.this.kafka_schema_registry
}

output "opensearch_acls_enabled" {
  description = "True if ACLs are enabled for OpenSearch"
  value       = ovh_cloud_project_database_service.this.opensearch_acls_enabled
}

###########################################
# ADVANCED CONFIGURATION
###########################################

output "advanced_configuration" {
  description = "Advanced key/value configurations applied to the service"
  value       = ovh_cloud_project_database_service.this.advanced_configuration
}
