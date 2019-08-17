resource "aws_iam_instance_profile" "bastions-kubernetesazat-com" {
  name = "bastions.kubernetesazat.com"
  role = "${aws_iam_role.bastions-kubernetesazat-com.name}"
}

resource "aws_iam_instance_profile" "masters-kubernetesazat-com" {
  name = "masters.kubernetesazat.com"
  role = "${aws_iam_role.masters-kubernetesazat-com.name}"
}

resource "aws_iam_instance_profile" "nodes-kubernetesazat-com" {
  name = "nodes.kubernetesazat.com"
  role = "${aws_iam_role.nodes-kubernetesazat-com.name}"
}

resource "aws_iam_role" "bastions-kubernetesazat-com" {
  name               = "bastions.kubernetesazat.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_bastions.kubernetesazat.com_policy")}"
}

resource "aws_iam_role" "masters-kubernetesazat-com" {
  name               = "masters.kubernetesazat.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.kubernetesazat.com_policy")}"
}

resource "aws_iam_role" "nodes-kubernetesazat-com" {
  name               = "nodes.kubernetesazat.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.kubernetesazat.com_policy")}"
}

resource "aws_iam_role_policy" "bastions-kubernetesazat-com" {
  name   = "bastions.kubernetesazat.com"
  role   = "${aws_iam_role.bastions-kubernetesazat-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_bastions.kubernetesazat.com_policy")}"
}

resource "aws_iam_role_policy" "masters-kubernetesazat-com" {
  name   = "masters.kubernetesazat.com"
  role   = "${aws_iam_role.masters-kubernetesazat-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.kubernetesazat.com_policy")}"
}

resource "aws_iam_role_policy" "nodes-kubernetesazat-com" {
  name   = "nodes.kubernetesazat.com"
  role   = "${aws_iam_role.nodes-kubernetesazat-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.kubernetesazat.com_policy")}"
}