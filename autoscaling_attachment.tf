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