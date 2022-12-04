#### ドメイン登録完了するまでコメントアウト

/*

#### ホストゾーンのデータソース定義
data "aws_route53_zone" "example" {
  name = "example.com"
}

#### ホストゾーンのリソース定義
resource "aws_route53_zone" "test_example" {
  name = "test.example.com"
}

#### ALBのDNSレコードの定義
resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.example.zone_id
  name = data.aws_route53_zone.example.name
  type = "A"

  alias {
    name = aws_lb.example.dns_name
    zone_id = aws_lb.example.zone_id
    evaluate_target_health = true
  }
}

output "domain_name" {
  value = aws_route53_record.example.name
}

*/