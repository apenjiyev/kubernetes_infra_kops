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