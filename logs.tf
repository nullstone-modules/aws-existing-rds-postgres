resource "aws_iam_user" "log_reader" {
  name = "log-reader-${local.resource_name}"
  tags = local.tags
}

resource "aws_iam_access_key" "log_reader" {
  user = aws_iam_user.log_reader.name
}

resource "aws_iam_user_policy" "log_reader" {
  name   = "AllowReadLogsAndMetrics"
  user   = aws_iam_user.log_reader.name
  policy = data.aws_iam_policy_document.log_reader.json
}

data "aws_iam_policy_document" "log_reader" {
  dynamic "statement" {
    for_each = len(local.enabled_logs) ? [1] : []

    content {
      sid    = "AllowReadLogs"
      effect = "Allow"

      actions = [
        "logs:Get*",
        "logs:List*",
        "logs:StartQuery",
        "logs:StopQuery",
        "logs:TestMetricFilter",
        "logs:Filter*"
      ]

      resources = [
        "arn:aws:logs:${local.region}:${local.account_id}:log-group:${local.cloudwatch_log_group_pg}",
        "arn:aws:logs:${local.region}:${local.account_id}:log-group:${local.cloudwatch_log_group_upgrade}",
      ]
    }
  }

  statement {
    sid       = "AllowGetMetrics"
    effect    = "Allow"
    resources = ["*"] // Metrics cannot be restricted by resource

    actions = [
      "cloudwatch:GetMetricData",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:ListMetrics",
    ]
  }
}
