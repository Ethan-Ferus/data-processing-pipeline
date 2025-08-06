resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.arn 
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.bucket.arn 
}

resource "aws_lambda_function" "lambda_function" {
    function_name = var.lambda_function_name
    role = aws_iam_role.lambda_exec_role.arn 
    s3_bucket = var.aws_s3_bucket_name
    s3_key = "lambda.zip"
    handler = "lambda_function.project-env-purpose"
    runtime = "python3.13"
    timeout = 30
    memory_size = 512

    depends_on = [aws_s3_object.upload_json]

    environment {
        variables = {
            STAGE = "prod"
            FEATURE_X = "enabled"
        }
    }
}