resource "aws_cloudfront_origin_access_control" "oac" {
  name                               = "portfolio-oac"
  origin_access_control_origin_type  = "s3"
  signing_behavior                   = "always"
  signing_protocol                   = "sigv4"
  description                        = "OAC for Cloud Portfolio"
}

resource "aws_cloudfront_distribution" "portfolio" {
  enabled             = true
  comment             = "Cloud Portfolio Distribution"
  default_root_object = "index.html"
  is_ipv6_enabled     = true
  web_acl_id          = "arn:aws:wafv2:us-east-1:886436948364:global/webacl/CreatedByCloudFront-4ece7fc3/edad39c9-80a6-40de-b264-7be606e43b79"

  origin {
    domain_name              = aws_s3_bucket.portfolio.bucket_regional_domain_name
    origin_id                = "s3-portfolio-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
  }

  aliases = [
    "sreekuttancl.com",
    "www.sreekuttancl.com"
  ]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-portfolio-origin"

    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.portfolio.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  tags = {
    Name = "CloudPortfolioCloudFront"
  }
}

