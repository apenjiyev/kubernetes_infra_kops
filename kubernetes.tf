

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

