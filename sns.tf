
# Slack通知用のアラームを流し込むためのSNSトピック
resource "aws_sns_topic" "nortification-slack" {
  name = "nortification-slack"
}
