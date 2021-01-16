resource "aws_s3_bucket" "web" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = false
  }

  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Id": "PolicyForCloudFrontPrivateContent",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "CanonicalUser": "${aws_cloudfront_origin_access_identity.s3.s3_canonical_user_id}"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.bucket_name}/*"
    }
  ]
}
POLICY

  tags = {
    type    = "website"
    service = var.domain
    domain  = var.domain
  }
}