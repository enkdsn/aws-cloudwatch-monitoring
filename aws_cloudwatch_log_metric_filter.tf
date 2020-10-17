

resource "aws_cloudwatch_log_metric_filter" "error_alarm" {

  # for_eachを利用するためにsetにする
  # 本来であればlog_groupのresourceに対して依存関係をもたせるが、
  # for_eachでどうやるのか現状わからない
  for_each = toset(var.cloudwatch_log_groups)

  name           = "${each.key}/error"
  pattern        = "ERROR"
  log_group_name = each.key

  metric_transformation {
    name      = "${each.key}/error"
    namespace = "error_alarm"
    value     = 1
  }

}
