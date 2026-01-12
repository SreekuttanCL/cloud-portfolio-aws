resource "aws_s3_bucket" "portfolio" {
  bucket = "sreekuttan-cloud-portfolio"

  force_destroy = true

  tags = {
    Name        = "Cloud Portfolio"
    Environment = "production"
  }
}

# Bucket policy for CloudFront OAC
data "aws_iam_policy_document" "portfolio_oac_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.portfolio.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.portfolio.arn]
    }

    sid = "AllowCloudFrontServicePrincipalReadOnly"
  }
}

resource "aws_s3_bucket_policy" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id
  policy = data.aws_iam_policy_document.portfolio_oac_policy.json
}

resource "aws_s3_bucket_public_access_block" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

