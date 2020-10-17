
# metric-filter.tfで定義したカスタムメトリクス用のアラーム
resource "aws_cloudwatch_metric_alarm" "test-alarm" {

  for_each = aws_cloudwatch_log_metric_filter.error_alarm

  alarm_name          = "${each.key}/alarm"                    # Set alarm name. you should define namespace for alarm
  comparison_operator = "GreaterThanOrEqualToThreshold"        # GreaterThanOrEqualToThreshold is >= 
  evaluation_periods  = "1"                                    # ?
  metric_name         = "${each.key}/error"                    # it's important to tie metric 
  namespace           = "test-alarm"                           # Set namespace
  period              = "120"                                  # Period must be 10, 30 or a multiple of 60sec
  statistic           = "Sum"                                  # Sum, Avarage etc...
  threshold           = "1"                                    # if over filter count 1, create alarm
  alarm_description   = "This metric monitors error occurence" # description

  # データ不足時のアクションを指定
  insufficient_data_actions = []

  # arnを指定すること
  alarm_actions = [aws_sns_topic.nortification-slack.arn]

}
