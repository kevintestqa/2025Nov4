// Not needed since we are using CloudFront. No need for static website
# resource "aws_s3_bucket_website_configuration" "static_site_documents_endpoints" {
#     bucket = aws_s3_bucket.static_site_front.id
    
#     index_document {
#       suffix = "index.html"
#     }

#     error_document {
#       key = "error.html"
#     }
# }


##########################
resource "aws_s3_bucket_public_access_block" "access_settings" {
    bucket = aws_s3_bucket.storage.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "cloudfront_access" {
    bucket = aws_s3_bucket.storage.id

    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontAccess"
        Effect    = "Allow"
        Principal =  {
          Service = "cloudfront.amazonaws.com"
        }
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.storage.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "${aws_cloudfront_distribution.s3_distribution.arn}"
          }
        }
      }
    ]
  })
    depends_on = [aws_s3_bucket_public_access_block.access_settings]
}