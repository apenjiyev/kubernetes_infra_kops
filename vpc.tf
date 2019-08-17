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

