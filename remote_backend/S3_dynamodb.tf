
# Create the S3 Bucket for the remote state-storage
resource "aws_s3_bucket" "S3_terraform_remote_state" {
  bucket = "tonyo987650-S3-wordpress"

  lifecycle {
    prevent_destroy = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Create a Dynamodb table to Lock the state file
resource "aws_dynamodb_table" "DB_terraform_remote_state" {
  name           = "remote-state-dynamodb-wordpress"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


# terraform {
#    backend "s3" {
#     bucket = "tonyo987650-S3-wordpress"
#     key    = "path"
#     region = "us-east-1"
#     dynamodb = "remote-state-dynamodb-wordpress"
#     encrypt = true
#    }
# }


