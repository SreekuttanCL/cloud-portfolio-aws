resource "aws_route53_zone" "portfolio" {
  name = "sreekuttancl.com"
}

resource "aws_route53_record" "portfolio_alias" {
  zone_id = aws_route53_zone.portfolio.zone_id
  name    = "sreekuttancl.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.portfolio.domain_name
    zone_id                = aws_cloudfront_distribution.portfolio.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_alias" {
  zone_id = aws_route53_zone.portfolio.zone_id
  name    = "www.sreekuttancl.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.portfolio.domain_name
    zone_id                = aws_cloudfront_distribution.portfolio.hosted_zone_id
    evaluate_target_health = false
  }
}



