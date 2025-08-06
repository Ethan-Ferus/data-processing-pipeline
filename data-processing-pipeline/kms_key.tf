resource "aws_kms_key" "sns" {
    description = "KMS key for SNS encryption"
    deletion_window_in_days = 10
    enable_key_rotation = var.kms_key_rotation
}

resource "aws_kms_key_policy" "example" {
    key_id = aws_kms_key.sns.id
    policy = jsonencode({
    Id = "example"
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }

        Resource = "*"
        Sid      = "Enable IAM User Permissions"
      },
    ]
    Version = "2012-10-17"
  })
}