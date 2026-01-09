resource "aws_s3_bucket" "portfolio" {
  bucket = "sreekuttan-cloud-portfolio"

  tags = {
    Name        = "Cloud Portfolio"
    Environment = "production"
  }
}

resource "aws_s3_bucket_public_access_block" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "portfolio_oac_policy" {
  statement {
    sid = "AllowCloudFrontServicePrincipalReadOnly"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.portfolio.arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values = [
        aws_cloudfront_distribution.portfolio.arn
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id
  policy = data.aws_iam_policy_document.portfolio_oac_policy.json
}


resource "aws_cloudfront_distribution" "portfolio" {
  enabled             = true
  comment             = "SreekuttanPortfolioWebsite"
  default_root_object = "index.html"
  is_ipv6_enabled     = true
  web_acl_id = "arn:aws:wafv2:us-east-1:886436948364:global/webacl/CreatedByCloudFront-4ece7fc3/edad39c9-80a6-40de-b264-7be606e43b79"

  origin {
    domain_name              = "sreekuttan-cloud-portfolio.s3.us-east-1.amazonaws.com"
    origin_id                = "sreekuttan-cloud-portfolio-origin"
    origin_access_control_id = "E1YO3QPSFC6B35"
  }
  

  aliases = [
    "sreekuttancl.com",
    "www.sreekuttancl.com"
  ]


  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "sreekuttan-cloud-portfolio-origin"

    viewer_protocol_policy = "redirect-to-https"
    compress = true
    
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  }

  tags = {
    Name = "SreekuttanPortfolioWebsite"
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
}

