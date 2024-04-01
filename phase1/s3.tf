# # provider "aws" {
# #   region = var.my-region # Update with your desired AWS region
# # }

# resource "aws_s3_bucket" "my-static-website" {
#   bucket = "my-example-static-website-bucket" # Replace with your desired bucket name
#   #acl    = "public-read"  # Set bucket ACL to allow public read access

#   website {
#     index_document = "index.html"  # Set the default index document

#   }
# }

# resource "aws_s3_bucket_ownership_controls" "example" {
#   bucket = aws_s3_bucket.my-static-website.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "example" {
#   bucket = aws_s3_bucket.my-static-website.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# resource "aws_s3_bucket_acl" "example" {
#   depends_on = [
#     aws_s3_bucket_ownership_controls.example,
#     aws_s3_bucket_public_access_block.example,
#   ]

#   bucket = aws_s3_bucket.my-static-website.id
#   acl    = "public-read"
# }
# resource "aws_s3_object" "index" {
#   bucket       = aws_s3_bucket.my-static-website.id
#   key          = "index.html"
#   content_type = "text/html"
#   source       = "${path.module}/index.html"  # Replace with the path to your index.html file
# }

