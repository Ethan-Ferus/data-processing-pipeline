resource "aws_cloudwatch_log_group" "log-group" {
    name = var.cloudwatch_log_group_name
    retention_in_days = 30
    kms_key_id = aws_kms_key.sns.arn 

    tags = {
        Enviroment = "prod"
    }
}