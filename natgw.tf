resource "aws_nat_gateway" "us-west-2a-kubernetesazat-com" {
  allocation_id = "${aws_eip.us-west-2a-kubernetesazat-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-2a-kubernetesazat-com.id}"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "us-west-2a.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_nat_gateway" "us-west-2b-kubernetesazat-com" {
  allocation_id = "${aws_eip.us-west-2b-kubernetesazat-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-2b-kubernetesazat-com.id}"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "us-west-2b.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_nat_gateway" "us-west-2c-kubernetesazat-com" {
  allocation_id = "${aws_eip.us-west-2c-kubernetesazat-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-2c-kubernetesazat-com.id}"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "us-west-2c.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}