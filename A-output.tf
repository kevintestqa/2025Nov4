output "website_url" {
  value = "https://${aws_cloudfront_distribution.s3_distribution.domain_name}"
}

output "content_url" {
  value = "http://${aws_cloudfront_distribution.s3_distribution.domain_name}/content/Panama-City-Panama-Trip-02.jpg"
}

output "json" {
  value =   jsonencode({
    Version = "2012-10-17"
})
}

output "raw" {
  value =  {
    Version = "2012-10-17"
  }
}

output "bucket_info" {
  value = {
    name = aws_s3_bucket.storage.bucket
    arn = aws_s3_bucket.storage.arn
  }
}

output "policy" {
  value = aws_s3_bucket.storage.policy
}