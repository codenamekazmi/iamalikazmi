hugo server -s . --themesDir=themes

## TROUBLESHOOTING

```
Error: error creating CloudFront Distribution: InvalidViewerCertificate: The certificate that is attached to your distribution doesn't cover the alternate domain name (CNAME) that you're trying to add. For more details, see: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/CNAMEs.html#alternate-domain-names-requirements
        status code: 400, request id: 8b43d520-c5e1-4b7a-bf95-37bf90778899

  on cf.tf line 5, in resource "aws_cloudfront_distribution" "web_s3":
   5: resource "aws_cloudfront_distribution" "web_s3" {
```

Solution: Commented out aliases

Website: https://stackoverflow.com/questions/59950775/error-creating-cloudfront-distribution-with-terraform-invalidviewercertificate