resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.storage.id
    key = "index.html"
    source = "./index.html"
    content_type = "index.html"
    etag = filemd5("./index.html")
}

resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.storage.id
    key = "error.html"
    source = "./error.html"
    content_type = "error.html"
    etag = filemd5("./error.html")
}

resource "aws_s3_object" "panama" {
    bucket = aws_s3_bucket.storage.id
    key = "Panama-City-Panama-Trip-02.jpg"
    source = "./Panama-City-Panama-Trip-02.jpg"
    content_type = "image/jpeg"
    etag = filemd5("./Panama-City-Panama-Trip-02.jpg")
}

resource "aws_s3_object" "image" {
    bucket = aws_s3_bucket.storage.id
    key = "image.jpg"
    source = "./image.jpg"
    content_type = "image/jpeg"
    etag = filemd5("./image.jpg")
}