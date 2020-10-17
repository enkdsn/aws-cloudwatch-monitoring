
# こいつらをfor_eachで作れれば一番いい
resource "aws_cloudwatch_log_group" "go-gateway-test" {
  name              = "/aws/lambda/go-gateway-test"
  retention_in_days = 7
  tags = {
    Application = "test"
  }
}


resource "aws_cloudwatch_log_group" "gotest" {
  name              = "/aws/lambda/gotest"
  retention_in_days = 7
  tags = {
    Application = "test"
  }
}
