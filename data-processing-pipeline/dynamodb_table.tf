resource "aws_dynamodb_table" "dynamodb-table" {
    name = var.dynamodb_table_name
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "user_id"
    range_key = "created_at"

    attribute {
        name = "user_id"
        type = "S"
    }

    attribute {
        name = "created_at"
        type = "S"
    }

    attribute {
        name = "email"
        type = "S"
    }

    global_secondary_index {
        name = var.dynamodb_table_GSI_name
        hash_key = "email"
        projection_type = "ALL"
    }
  
    ttl {
        attribute_name = var.dynamodb_table_ttl_name
        enabled = true
    }

    stream_enabled = var.dynamodb_table_stream_enabled
    stream_view_type = "NEW_IMAGE"

    tags = {
        Enviroment = "prod"
    }
}