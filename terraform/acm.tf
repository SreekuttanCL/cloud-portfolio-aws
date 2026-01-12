resource "aws_acm_certificate" "portfolio" {
  domain_name       = "sreekuttancl.com"
  validation_method = "DNS"

  subject_alternative_names = ["www.sreekuttancl.com"]

  tags = {
    Name = "CloudPortfolioCert"
  }
}

