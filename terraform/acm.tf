resource "aws_acm_certificate" "portfolio" {
  domain_name               = "sreekuttancl.com"
  subject_alternative_names = ["www.sreekuttancl.com"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "CloudPortfolioCert"
  }
}

