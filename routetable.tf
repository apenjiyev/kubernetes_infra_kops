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
