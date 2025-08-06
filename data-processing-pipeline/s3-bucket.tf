resource "aws_s3_bucket" "bucket" {
    bucket = var.aws_s3_bucket_name
}

resource "aws_s3_bucket_notification" "bucket-notification-3409" {
    bucket = aws_s3_bucket.bucket.id 

    lambda_function {
      lambda_function_arn = aws_lambda_function.lambda_function.arn 
      events = ["s3:ObjectCreated:*"]
    }

    depends_on = [aws_lambda_permission.allow_bucket]
}   

resource "aws_s3_object" "upload_json" {
    bucket = aws_s3_bucket.bucket.id 

    key = "lambda.zip"
    source = "lambda.zip"
    etag = filebase64sha256("lambda.zip")
    content_type = "json"
}