variable "aws_region" {
    type = string
    default = "eu-north-1"
}

variable "aws_s3_bucket_name" {
    type = string
    default = "smart-scalper-bucket-2025"
}

variable "dynamodb_table_name" {
    type = string
    default = "prod-users-table"
}

variable "dynamodb_table_GSI_name" {
    type = string
    default = "email-index"
}

variable "dynamodb_table_ttl_name" {
    type = string
    default = "expires_at"
}

variable "dynamodb_table_stream_enabled" {
    type = bool
    default = true 
}

variable "iam_role_name" {
    type = string
    default = "lambda_exec_role"
}

variable "lambda_function_name" {
    type = string
    default = "project-env-purpose"
}

variable "kms_key_rotation" {
    type = bool
    default = true 
}

variable "cloudwatch_log_group_name" {
    type = string
    default = "proccessing-pipeline-log-group"
}