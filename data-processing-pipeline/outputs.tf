output "sns_topic_arn" {
    value = aws_sns_topic.user_updates.arn 
}

output "lambda_function_name" {
    value = aws_lambda_function.lambda_function.function_name 
}

output "lambda_invoke_arn" {
    value = aws_lambda_function.lambda_function.invoke_arn 
}

