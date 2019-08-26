variable "database_identifier" {
  description = "Name of the instance"
  type        = string
}

variable "slack_channel" {
  description = "Slack channel to send alert to besides #alerts-db"
  type        = string
}

variable "slack_lambda_sns_topic_arn" {
  description = "Slack lambda sns topic arn"
  type        = string
}

variable "pager_duty_sns_topic_arn" {
  description = "PagerDuty sns topic arn"
  type        = string
}

variable "aws_account_id" {
  description = "The AWS account id"
  type        = number
}

variable "network" {
  type    = string
  default = "eu-west-1"
}

variable "region" {
  description = "The region of AWS"
  type        = string
}

variable "regions" {
  type        = map(string)
  description = "Map of vpc ids"

  default = {
    "eu-west-1"        = "eu-west-1"
    "eu-central-1-old" = "eu-central-1"
    "eu-central-1-new" = "eu-central-1"
  }
}

variable "create_alarms" {
  description = "If set to false, do not create any alarms"
  type        = bool
  default     = true
}

# -- Variables for storage alerts --

variable "database_storage" {
  description = "Instance storage in GB"
}

variable "create_storage_80_alert" {
  description = "If set to true, create an storage alert for 80% utilization"
  type        = bool
  default     = true
}

variable "create_storage_85_alert" {
  description = "If set to true, create an storage alert for 85% utilization"
  type        = bool
  default     = true
}

variable "create_storage_90_alert" {
  description = "If set to true, create an storage alert for 90% utilization"
  type        = bool
  default     = true
}

variable "create_storage_95_alert" {
  description = "If set to true, create an storage alert for 95% utilization"
  type        = bool
  default     = true
}

# -- Variables for connection count alerts --

variable "max_connection_count" {
  description = "Max connection count based on db param group and DBInstanceClassMemory"
}

variable "create_connction_count_80_alert" {
  description = "If set to true, create an alert for 85% connection count utilization"
  type        = bool
  default     = true
}

variable "create_connction_count_90_alert" {
  description = "If set to true, create an alert for 95% connection count utilization"
  type        = bool
  default     = true
}

# -- Variables for CPU alerts --

variable "db_instance_max_cpu_credits" {
  description = "CPUCredit balance threshold"
}

variable "create_cpu_95_alert" {
  description = "If set to true, create an alert for 95% CPU utilization"
  type        = bool
  default     = true
}

variable "cpu_alarm_enable_pd" {
  description = "If set to true, alarm with PD integration will be deployed"
  type        = bool
  default     = false
}

variable "create_cpu_credit_alert" {
  description = "If set to true, create an CPU credit alert"
  type        = bool
  default     = false
}

# -- Variables for memory alerts --

variable "db_instance_class_memory" {
  description = "Rds instance class memory"
}

variable "create_memory_80_alert" {
  description = "If set to true, create an alert for memory 80% utilization"
  type        = bool
  default     = true
}

variable "create_memory_90_alert" {
  description = "If set to true, create an alert for memory 90% utilization"
  type        = bool
  default     = true
}

# -- Variables for replication alerts --

variable "create_replica_lag_alert" {
  description = "If set to true, create an replication lag alert"
  type        = bool
  default     = false
}

variable "replica_lag_threshold" {
  description = "Threshold for replication lag in seconds"
  type        = number
  default     = 300
}

# -- Variables for status alerts --
variable "create_rds_dd_status" {
  description = "Alert for instance status"
  type        = bool
  default     = true
}

variable "dd_prod_slack_channel" {
  description = "Datadog slack channel identifier for RDS status alarms"
  type        = string
  default     = "@slack-Main_Account-alerts-db"
}
