resource "aws_acm_certificate_validation" "portfolio" {
  certificate_arn         = aws_acm_certificate.portfolio.arn
  validation_record_fqdns = [
    for record in aws_route53_record.portfolio_dns_validation : record.fqdn
  ]
}

resource "aws_route53_record" "portfolio_dns_validation" {
  for_each = {
    for dvo in aws_acm_certificate.portfolio.domain_validation_options : dvo.domain_name => dvo
  }

  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  zone_id = aws_route53_zone.portfolio.zone_id
  records = [each.value.resource_record_value]
  ttl     = 60
}

