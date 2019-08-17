resource "aws_route53_record" "api-kubernetesazat-com" {
  name = "api.kubernetesazat.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-kubernetesazat-com.dns_name}"
    zone_id                = "${aws_elb.api-kubernetesazat-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z242KXJJFB1Y9F"
}

resource "aws_route53_record" "bastion-kubernetesazat-com" {
  name = "bastion.kubernetesazat.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.bastion-kubernetesazat-com.dns_name}"
    zone_id                = "${aws_elb.bastion-kubernetesazat-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z242KXJJFB1Y9F"
}

resource "aws_route53_zone_association" "Z242KXJJFB1Y9F" {
  zone_id = "/hostedzone/Z242KXJJFB1Y9F"
  vpc_id  = "${aws_vpc.kubernetesazat-com.id}"
}