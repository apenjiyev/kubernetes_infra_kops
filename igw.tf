resource "aws_internet_gateway" "kubernetesazat-com" {
  vpc_id = "${aws_vpc.kubernetesazat-com.id}"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}