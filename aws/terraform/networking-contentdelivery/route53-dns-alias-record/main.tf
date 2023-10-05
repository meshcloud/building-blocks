data "aws_route53_zone" "zone" {
  name         = var.zone_name
  private_zone = var.private_zone
}

resource "aws_route53_record" "record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = join(".", compact([var.sub, data.aws_route53_zone.zone.name]))
  type    = var.type

  alias {
    name                   = var.alias_name
    evaluate_target_health = var.alias_evaluate_target_health
    zone_id                = var.alias_zone_id
  }  
}
