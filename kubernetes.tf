provider "aws" {
  region = "us-west-2"
}

resource "aws_autoscaling_attachment" "bastions-kubernetesazat-com" {
  elb                    = "${aws_elb.bastion-kubernetesazat-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.bastions-kubernetesazat-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2a-masters-kubernetesazat-com" {
  elb                    = "${aws_elb.api-kubernetesazat-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2a-masters-kubernetesazat-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2b-masters-kubernetesazat-com" {
  elb                    = "${aws_elb.api-kubernetesazat-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2b-masters-kubernetesazat-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2c-masters-kubernetesazat-com" {
  elb                    = "${aws_elb.api-kubernetesazat-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2c-masters-kubernetesazat-com.id}"
}

resource "aws_autoscaling_group" "bastions-kubernetesazat-com" {
  name                 = "bastions.kubernetesazat.com"
  launch_configuration = "${aws_launch_configuration.bastions-kubernetesazat-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.utility-us-west-2a-kubernetesazat-com.id}", "${aws_subnet.utility-us-west-2b-kubernetesazat-com.id}", "${aws_subnet.utility-us-west-2c-kubernetesazat-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetesazat.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "bastions.kubernetesazat.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "bastions"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/bastion"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2a-masters-kubernetesazat-com" {
  name                 = "master-us-west-2a.masters.kubernetesazat.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-2a-masters-kubernetesazat-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2a-kubernetesazat-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetesazat.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2a.masters.kubernetesazat.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2a"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2b-masters-kubernetesazat-com" {
  name                 = "master-us-west-2b.masters.kubernetesazat.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-2b-masters-kubernetesazat-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2b-kubernetesazat-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetesazat.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2b.masters.kubernetesazat.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2c-masters-kubernetesazat-com" {
  name                 = "master-us-west-2c.masters.kubernetesazat.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-2c-masters-kubernetesazat-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2c-kubernetesazat-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetesazat.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2c.masters.kubernetesazat.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2c"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-kubernetesazat-com" {
  name                 = "nodes.kubernetesazat.com"
  launch_configuration = "${aws_launch_configuration.nodes-kubernetesazat-com.id}"
  max_size             = 2
  min_size             = 2
  vpc_zone_identifier  = ["${aws_subnet.us-west-2a-kubernetesazat-com.id}", "${aws_subnet.us-west-2b-kubernetesazat-com.id}", "${aws_subnet.us-west-2c-kubernetesazat-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetesazat.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.kubernetesazat.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "a-etcd-events-kubernetesazat-com" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "a.etcd-events.kubernetesazat.com"
    "k8s.io/etcd/events"                       = "a/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_ebs_volume" "a-etcd-main-kubernetesazat-com" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "a.etcd-main.kubernetesazat.com"
    "k8s.io/etcd/main"                         = "a/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-events-kubernetesazat-com" {
  availability_zone = "us-west-2b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "b.etcd-events.kubernetesazat.com"
    "k8s.io/etcd/events"                       = "b/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-kubernetesazat-com" {
  availability_zone = "us-west-2b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "b.etcd-main.kubernetesazat.com"
    "k8s.io/etcd/main"                         = "b/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-events-kubernetesazat-com" {
  availability_zone = "us-west-2c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "c.etcd-events.kubernetesazat.com"
    "k8s.io/etcd/events"                       = "c/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-main-kubernetesazat-com" {
  availability_zone = "us-west-2c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "c.etcd-main.kubernetesazat.com"
    "k8s.io/etcd/main"                         = "c/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_eip" "us-west-2a-kubernetesazat-com" {
  vpc = true

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "us-west-2a.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_eip" "us-west-2b-kubernetesazat-com" {
  vpc = true

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "us-west-2b.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_eip" "us-west-2c-kubernetesazat-com" {
  vpc = true

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "us-west-2c.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_elb" "api-kubernetesazat-com" {
  name = "api-kubernetesazat-com-gtklp9"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-kubernetesazat-com.id}"]
  subnets         = ["${aws_subnet.utility-us-west-2a-kubernetesazat-com.id}", "${aws_subnet.utility-us-west-2b-kubernetesazat-com.id}", "${aws_subnet.utility-us-west-2c-kubernetesazat-com.id}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "api.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_elb" "bastion-kubernetesazat-com" {
  name = "bastion-kubernetesazat-co-2otp03"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-kubernetesazat-com.id}"]
  subnets         = ["${aws_subnet.utility-us-west-2a-kubernetesazat-com.id}", "${aws_subnet.utility-us-west-2b-kubernetesazat-com.id}", "${aws_subnet.utility-us-west-2c-kubernetesazat-com.id}"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "bastion.kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

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

resource "aws_internet_gateway" "kubernetesazat-com" {
  vpc_id = "${aws_vpc.kubernetesazat-com.id}"

  tags = {
    KubernetesCluster                          = "kubernetesazat.com"
    Name                                       = "kubernetesazat.com"
    "kubernetes.io/cluster/kubernetesazat.com" = "owned"
  }
}

resource "aws_key_pair" "kubernetes-kubernetesazat-com-93d79cc4cf6e8f8a24eb688f53d81d94" {
  key_name   = "kubernetes.kubernetesazat.com-93:d7:9c:c4:cf:6e:8f:8a:24:eb:68:8f:53:d8:1d:94"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.kubernetesazat.com-93d79cc4cf6e8f8a24eb688f53d81d94_public_key")}"
}

resource "aws_launch_configuration" "bastions-kubernetesazat-com" {
  name_prefix                 = "bastions.kubernetesazat.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesazat-com-93d79cc4cf6e8f8a24eb688f53d81d94.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-kubernetesazat-com.id}"
  security_groups             = ["${aws_security_group.bastion-kubernetesazat-com.id}"]
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2a-masters-kubernetesazat-com" {
  name_prefix                 = "master-us-west-2a.masters.kubernetesazat.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesazat-com-93d79cc4cf6e8f8a24eb688f53d81d94.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kubernetesazat-com.id}"
  security_groups             = ["${aws_security_group.masters-kubernetesazat-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2a.masters.kubernetesazat.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2b-masters-kubernetesazat-com" {
  name_prefix                 = "master-us-west-2b.masters.kubernetesazat.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesazat-com-93d79cc4cf6e8f8a24eb688f53d81d94.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kubernetesazat-com.id}"
  security_groups             = ["${aws_security_group.masters-kubernetesazat-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2b.masters.kubernetesazat.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2c-masters-kubernetesazat-com" {
  name_prefix                 = "master-us-west-2c.masters.kubernetesazat.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesazat-com-93d79cc4cf6e8f8a24eb688f53d81d94.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kubernetesazat-com.id}"
  security_groups             = ["${aws_security_group.masters-kubernetesazat-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2c.masters.kubernetesazat.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-kubernetesazat-com" {
  name_prefix                 = "nodes.kubernetesazat.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesazat-com-93d79cc4cf6e8f8a24eb688f53d81d94.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-kubernetesazat-com.id}"
  security_groups             = ["${aws_security_group.nodes-kubernetesazat-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.kubernetesazat.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

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

terraform = {
  required_version = ">= 0.9.3"
}
