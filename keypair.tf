resource "aws_key_pair" "kubernetes-kubernetesazat-com-93d79cc4cf6e8f8a24eb688f53d81d94" {
  key_name   = "kubernetes.kubernetesazat.com-93:d7:9c:c4:cf:6e:8f:8a:24:eb:68:8f:53:d8:1d:94"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.kubernetesazat.com-93d79cc4cf6e8f8a24eb688f53d81d94_public_key")}"
}