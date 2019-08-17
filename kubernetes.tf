

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.kubernetesazat-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.kubernetesazat-com.id}"
}

resource "aws_route" "private-us-west-2a-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-2a-kubernetesazat-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-2a-kubernetesazat-com.id}"
}

resource "aws_route" "private-us-west-2b-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-2b-kubernetesazat-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-2b-kubernetesazat-com.id}"
}

resource "aws_route" "private-us-west-2c-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-2c-kubernetesazat-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-2c-kubernetesazat-com.id}"
}

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

resource "aws_route_table" "kubernetesazat-com" {
  vpc_id = "${aws_vpc.kubernetesazat-com.id}"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
    "kubernetes.io/kops/role"                  = "public"
  }
}

resource "aws_route_table" "private-us-west-2a-kubernetesazat-com" {
  vpc_id = "${aws_vpc.kubernetesazat-com.id}"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "private-us-west-2a.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
    "kubernetes.io/kops/role"                  = "private-us-west-2a"
  }
}

resource "aws_route_table" "private-us-west-2b-kubernetesazat-com" {
  vpc_id = "${aws_vpc.kubernetesazat-com.id}"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "private-us-west-2b.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
    "kubernetes.io/kops/role"                  = "private-us-west-2b"
  }
}

resource "aws_route_table" "private-us-west-2c-kubernetesazat-com" {
  vpc_id = "${aws_vpc.kubernetesazat-com.id}"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "private-us-west-2c.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
    "kubernetes.io/kops/role"                  = "private-us-west-2c"
  }
}

resource "aws_route_table_association" "private-us-west-2a-kubernetesazat-com" {
  subnet_id      = "${aws_subnet.us-west-2a-kubernetesazat-com.id}"
  route_table_id = "${aws_route_table.private-us-west-2a-kubernetesazat-com.id}"
}

resource "aws_route_table_association" "private-us-west-2b-kubernetesazat-com" {
  subnet_id      = "${aws_subnet.us-west-2b-kubernetesazat-com.id}"
  route_table_id = "${aws_route_table.private-us-west-2b-kubernetesazat-com.id}"
}

resource "aws_route_table_association" "private-us-west-2c-kubernetesazat-com" {
  subnet_id      = "${aws_subnet.us-west-2c-kubernetesazat-com.id}"
  route_table_id = "${aws_route_table.private-us-west-2c-kubernetesazat-com.id}"
}

resource "aws_route_table_association" "utility-us-west-2a-kubernetesazat-com" {
  subnet_id      = "${aws_subnet.utility-us-west-2a-kubernetesazat-com.id}"
  route_table_id = "${aws_route_table.kubernetesazat-com.id}"
}

resource "aws_route_table_association" "utility-us-west-2b-kubernetesazat-com" {
  subnet_id      = "${aws_subnet.utility-us-west-2b-kubernetesazat-com.id}"
  route_table_id = "${aws_route_table.kubernetesazat-com.id}"
}

resource "aws_route_table_association" "utility-us-west-2c-kubernetesazat-com" {
  subnet_id      = "${aws_subnet.utility-us-west-2c-kubernetesazat-com.id}"
  route_table_id = "${aws_route_table.kubernetesazat-com.id}"
}

resource "aws_security_group" "api-elb-kubernetesazat-com" {
  name        = "api-elb.kubernetesazat.com"
  vpc_id      = "${aws_vpc.kubernetesazat-com.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "api-elb.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_security_group" "bastion-elb-kubernetesazat-com" {
  name        = "bastion-elb.kubernetesazat.com"
  vpc_id      = "${aws_vpc.kubernetesazat-com.id}"
  description = "Security group for bastion ELB"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "bastion-elb.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_security_group" "bastion-kubernetesazat-com" {
  name        = "bastion.kubernetesazat.com"
  vpc_id      = "${aws_vpc.kubernetesazat-com.id}"
  description = "Security group for bastion"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "bastion.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_security_group" "masters-kubernetesazat-com" {
  name        = "masters.kubernetesazat.com"
  vpc_id      = "${aws_vpc.kubernetesazat-com.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "masters.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_security_group" "nodes-kubernetesazat-com" {
  name        = "nodes.kubernetesazat.com"
  vpc_id      = "${aws_vpc.kubernetesazat-com.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "nodes.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.masters-kubernetesazat-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.masters-kubernetesazat-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetesazat-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-kubernetesazat-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-kubernetesazat-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-elb-kubernetesazat-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-to-master-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.bastion-kubernetesazat-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "bastion-to-node-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.bastion-kubernetesazat-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-kubernetesazat-com.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.api-elb-kubernetesazat-com.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "icmp-pmtu-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-kubernetesazat-com.id}"
  from_port         = 3
  to_port           = 4
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-kubernetesazat-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-kubernetesazat-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetesazat-com.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetesazat-com.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetesazat-com.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetesazat-com.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-elb-to-bastion" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.bastion-kubernetesazat-com.id}"
  source_security_group_id = "${aws_security_group.bastion-elb-kubernetesazat-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "ssh-external-to-bastion-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.bastion-elb-kubernetesazat-com.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "us-west-2a-kubernetesazat-com" {
  vpc_id            = "${aws_vpc.kubernetesazat-com.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "us-west-2a"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "us-west-2a.kubernetesazat.com"
    SubnetType                                 = "Private"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
    "kubernetes.io/role/internal-elb"          = "1"
  }
}

resource "aws_subnet" "us-west-2b-kubernetesazat-com" {
  vpc_id            = "${aws_vpc.kubernetesazat-com.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "us-west-2b"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "us-west-2b.kubernetesazat.com"
    SubnetType                                 = "Private"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
    "kubernetes.io/role/internal-elb"          = "1"
  }
}

resource "aws_subnet" "us-west-2c-kubernetesazat-com" {
  vpc_id            = "${aws_vpc.kubernetesazat-com.id}"
  cidr_block        = "172.20.96.0/19"
  availability_zone = "us-west-2c"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "us-west-2c.kubernetesazat.com"
    SubnetType                                 = "Private"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
    "kubernetes.io/role/internal-elb"          = "1"
  }
}

resource "aws_subnet" "utility-us-west-2a-kubernetesazat-com" {
  vpc_id            = "${aws_vpc.kubernetesazat-com.id}"
  cidr_block        = "172.20.0.0/22"
  availability_zone = "us-west-2a"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "utility-us-west-2a.kubernetesazat.com"
    SubnetType                                 = "Utility"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
    "kubernetes.io/role/elb"                   = "1"
  }
}

resource "aws_subnet" "utility-us-west-2b-kubernetesazat-com" {
  vpc_id            = "${aws_vpc.kubernetesazat-com.id}"
  cidr_block        = "172.20.4.0/22"
  availability_zone = "us-west-2b"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "utility-us-west-2b.kubernetesazat.com"
    SubnetType                                 = "Utility"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
    "kubernetes.io/role/elb"                   = "1"
  }
}

resource "aws_subnet" "utility-us-west-2c-kubernetesazat-com" {
  vpc_id            = "${aws_vpc.kubernetesazat-com.id}"
  cidr_block        = "172.20.8.0/22"
  availability_zone = "us-west-2c"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "utility-us-west-2c.kubernetesazat.com"
    SubnetType                                 = "Utility"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
    "kubernetes.io/role/elb"                   = "1"
  }
}

resource "aws_vpc" "kubernetesazat-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "kubernetesazat-com" {
  domain_name         = "us-west-2.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "kubernetesazat-com" {
  vpc_id          = "${aws_vpc.kubernetesazat-com.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.kubernetesazat-com.id}"
}

