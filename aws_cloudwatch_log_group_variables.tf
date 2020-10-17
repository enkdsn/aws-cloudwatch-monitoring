
# logグループの名前をそのまま記載していく
# 本来であれば、個々のlog_groupに対して依存関係をもたせるべき
variable cloudwatch_log_groups {
  default = [
    "/aws/lambda/go-gateway-test",
    "/aws/lambda/gotest",
  ]
}
