##############################
# Required Core Parameters
##############################

variable "database_service_name" {
  description = "OVH Cloud Project ID (service_name)"
  type        = string
}

variable "database_engine" {
  description = "Type of database engine (redis, postgresql, mysql, mongodb, kafka, opensearch)"
  type        = string
}

variable "database_version" {
  description = "Database engine version"
  type        = string
}

variable "database_plan" {
  description = "Database plan (varies by engine)"
  type        = string
}

variable "database_flavor" {
  description = "Instance flavor name (e.g. db1-7)"
  type        = string
}

##############################
# Optional Settings
##############################

variable "database_description" {
  type    = string
  default = null
}

variable "database_disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = null
}

variable "database_deletion_protection" {
  type    = bool
  default = true
}

variable "database_backup_regions" {
  type    = list(string)
  default = []
}

variable "database_backup_time" {
  description = "HH:MM (not usable for kafka, opensearch, m3db, ...)"
  type        = string
  default     = null
}

variable "database_maintenance_time" {
  description = "HH:MM start time for maintenance windows"
  type        = string
  default     = null
}

variable "database_advanced_configuration" {
  description = "Key/value advanced configuration"
  type        = map(string)
  default     = {}
}

##############################
# Engine-specific features
##############################

variable "database_kafka_rest_api" {
  type    = bool
  default = false
}

variable "database_kafka_schema_registry" {
  type    = bool
  default = false
}

variable "database_opensearch_acls_enabled" {
  type    = bool
  default = false
}

##############################
# Nodes (multi-region not supported)
##############################

variable "database_nodes" {
  description = "List of node definitions"
  type = list(object({
    region     = string
    network_id = string
    subnet_id  = string
  }))
}

##############################
# IP Restrictions
##############################

variable "ip_restrictions" {
  description = "List of allowed IPs"
  type = list(object({
    ip          = string
    description = optional(string)
  }))
  default = []
}
