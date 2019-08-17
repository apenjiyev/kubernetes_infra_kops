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
