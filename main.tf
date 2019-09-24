# STORAGE

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_alarm_storage_80" {
  count = var.create_storage_80_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-storage-${var.database_identifier}-80"
  alarm_description   = "Free storage space on ${var.database_identifier} is less then 80% (${var.database_storage * 0.2}/${var.database_storage} GB) Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=lack-of-free-space"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  threshold           = var.database_storage * 1073741824 * 0.2
  statistic           = "Average"
  provider            = aws

  alarm_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_alarm_storage_85" {
  count = var.create_storage_85_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-storage-${var.database_identifier}-85"
  alarm_description   = "Free storage space on ${var.database_identifier} is less then 85% (${var.database_storage * 0.15}/${var.database_storage} GB) Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=lack-of-free-space"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  threshold           = var.database_storage * 1073741824 * 0.15
  statistic           = "Average"
  provider            = aws

  alarm_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_alarm_storage_90" {
  count = var.create_storage_90_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-storage-${var.database_identifier}-90"
  alarm_description   = "Free storage space on ${var.database_identifier} is less then 90% (${var.database_storage * 0.1}/${var.database_storage} GB) Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=lack-of-free-space"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  threshold           = var.database_storage * 1073741824 * 0.1
  statistic           = "Average"
  provider            = aws

  alarm_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_alarm_storage_95" {
  count = var.create_storage_95_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-storage-${var.database_identifier}-95"
  alarm_description   = "Free storage space on ${var.database_identifier} is less then 95% (${var.database_storage * 0.05}/${var.database_storage} GB) Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=lack-of-free-space"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  threshold           = var.database_storage * 1073741824 * 0.05
  statistic           = "Average"
  provider            = aws

  alarm_actions = [
    var.pager_duty_sns_topic_arn,
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.pager_duty_sns_topic_arn,
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

# CONNECTION COUNT

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_alarm_conn_count_80" {
  count = var.create_connction_count_80_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-conn-count-${var.database_identifier}-80"
  alarm_description   = "Connections count on ${var.database_identifier} reached 80% of maximum ${var.max_connection_count} Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=high-connection-count"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 300
  threshold           = floor(var.max_connection_count * 0.8)
  statistic           = "Maximum"
  provider            = aws

  alarm_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_alarm_conn_count_90" {
  count = var.create_connction_count_90_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-conn-count-${var.database_identifier}-90"
  alarm_description   = "Connections count on ${var.database_identifier} reached 90% of maximum ${var.max_connection_count} Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=high-connection-count"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 60
  threshold           = floor(var.max_connection_count * 0.9)
  statistic           = "Maximum"
  provider            = aws

  alarm_actions = [
    var.pager_duty_sns_topic_arn,
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.pager_duty_sns_topic_arn,
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

# CPU

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_alarm_cpu_95" {
  count = var.cpu_alarm_enable_pd == false ? (var.create_cpu_95_alert && var.create_alarms ? 1 : 0) : 0

  alarm_name          = "rds-alarm-cpu-${var.database_identifier}-95"
  alarm_description   = "CPU utilization on ${var.database_identifier} reached 95% Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=high-cpu-usage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  threshold           = 95
  statistic           = "Average"
  provider            = aws

  alarm_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_alarm_cpu_95_PD_enabled" {
  count = var.cpu_alarm_enable_pd && var.create_cpu_95_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-cpu-${var.database_identifier}-95-PD-enabled"
  alarm_description   = "CPU utilization on ${var.database_identifier} reached 95% Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=high-cpu-usage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  threshold           = 95
  statistic           = "Average"
  provider            = aws

  alarm_actions = [
    var.pager_duty_sns_topic_arn,
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.pager_duty_sns_topic_arn,
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_cpucredit_balance_20" {
  count = var.create_cpu_credit_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-cpucredit-balance-${var.database_identifier}-20"
  alarm_description   = "CPU credit balance on ${var.database_identifier} is less than 20% (${format("%.1f", (var.db_instance_max_cpu_credits * 0.2))}/${var.db_instance_max_cpu_credits}) Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=lack-of-available-credits-in-t2-instances"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUCreditBalance"
  namespace           = "AWS/RDS"
  period              = 600
  threshold           = var.db_instance_max_cpu_credits * 0.2
  statistic           = "Average"
  provider            = aws

  alarm_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

# MEMORY

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_alarm_memory_80" {
  count = var.create_memory_80_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-memory-${var.database_identifier}-80"
  alarm_description   = "The amount of used memory on ${var.database_identifier} is more than 80% (${var.db_instance_class_memory * 0.8}/${var.db_instance_class_memory} GB) Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=high-memory-usage"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = 300
  threshold           = var.db_instance_class_memory * 1073741824 * 0.2
  statistic           = "Average"
  provider            = aws

  alarm_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_alarm_memory_90" {
  count = var.create_memory_90_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-memory-${var.database_identifier}-90"
  alarm_description   = "The amount of used memory on ${var.database_identifier} is more than 90% (${var.db_instance_class_memory * 0.9}/${var.db_instance_class_memory} GB) Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=high-memory-usage"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = 60
  threshold           = var.db_instance_class_memory * 1073741824 * 0.1
  statistic           = "Average"
  provider            = aws

  alarm_actions = [
    var.pager_duty_sns_topic_arn,
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.pager_duty_sns_topic_arn,
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

# REPLICATION LAG

resource "aws_cloudwatch_metric_alarm" "rds_cloudwatch_replication_lag" {
  count = var.create_replica_lag_alert && var.create_alarms ? 1 : 0

  alarm_name          = "rds-alarm-replication-lag-${var.database_identifier}"
  alarm_description   = "Replication lag on ${var.database_identifier} is more than ${var.replica_lag_threshold / 60} minutes Slack:${var.slack_channel} Runbook:https://kiwi.wiki/devops/wiki/#/operations/runbooks/rds_runbook/rds_runbook?id=high-replica-lag-on-read-replica"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ReplicaLag"
  namespace           = "AWS/RDS"
  period              = 300
  threshold           = var.replica_lag_threshold
  statistic           = "Average"
  provider            = aws

  alarm_actions = [
    var.pager_duty_sns_topic_arn,
    var.slack_lambda_sns_topic_arn,
  ]

  ok_actions = [
    var.pager_duty_sns_topic_arn,
    var.slack_lambda_sns_topic_arn,
  ]

  dimensions = {
    DBInstanceIdentifier = var.database_identifier
  }
}

data "template_file" "dd_message_rds_status" {
  template = "{{#is_alert}}\nRDS {{ host }} is in state **{{ value }}** (see below)\n\n2:   failed\n3:   inaccessible-encryption-credentials\n4:   incompatible-network\n5:   incompatible-option-group\n6:   incompatible-parameters\n7:   incompatible-restore\n8:   maintenance\n9:   moving-to-vpc\n10: rebooting\n11: renaming\n12: stopping\n13: stopped\n14: storage-full\n15: upgrading\n{{/is_alert}}\n{{#is_recovery}}RDS {{ host }} is in **available** state{{/is_recovery}}\n${var.dd_prod_slack_channel}"

  vars = {
    database_identifier   = var.database_identifier
    dd_prod_slack_channel = var.dd_prod_slack_channel
  }
}

# STATUS

resource "datadog_monitor" "rds_dd_status" {
  count = var.create_rds_dd_status && var.create_alarms ? 1 : 0

  message             = data.template_file.dd_message_rds_status.rendered
  name                = "RDS ${var.database_identifier} is not in available state"
  query               = "max(last_1m):max:kw.rds.status.available{dbinstanceidentifier:martindb} by {host} >= 2"
  type                = "metric alert"
  notify_no_data      = false
  tags                = [
    "service:devops"]
  require_full_window = true
  include_tags        = false

  thresholds = {
    critical          = 2
    critical_recovery = 1.5
  }
}
