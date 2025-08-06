resource "aws_sns_topic" "user_updates" {
    name = "my-alerts-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
    topic_arn = aws_sns_topic.user_updates.arn
    protocol = "email"
    endpoint = "ferusethan388@gmail.com"
}