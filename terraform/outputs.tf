output "s3_bucket_domain_name" {
    value = aws_s3_bucket.em-bucket.*.bucket_domain_name
}

output "s3_website_endpoint" {
    value = aws_s3_bucket_website_configuration.em-bucket.*.website_endpoint

}
output "s3_bucket_arn" {
    value = aws_s3_bucket.em-bucket.*.arn
}

output "s3_bucket_id" {
    value = aws_s3_bucket.em-bucket.*.id
}


