terraform {
  backend "s3" {
    bucket = "first-bucket-to-store-state-file"                  # Your S3 bucket name
    key    = "terraform/terraform.tfstate"  # Path inside the bucket
    region =  "ap-northeast-3"    # Same as your aws_region variable
    dynamodb_table="use_locks"
    encrypt = true
  }
}
