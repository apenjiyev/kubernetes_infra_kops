output "bastion_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.bastions-kubernetesazat-com.id}"]
}

output "bastion_security_group_ids" {
  value = ["${aws_security_group.bastion-kubernetesazat-com.id}"]
}

output "bastions_role_arn" {
  value = "${aws_iam_role.bastions-kubernetesazat-com.arn}"
}

output "bastions_role_name" {
  value = "${aws_iam_role.bastions-kubernetesazat-com.name}"
}

output "cluster_name" {
  value = "kubernetesazat.com"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-us-west-2a-masters-kubernetesazat-com.id}", "${aws_autoscaling_group.master-us-west-2b-masters-kubernetesazat-com.id}", "${aws_autoscaling_group.master-us-west-2c-masters-kubernetesazat-com.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-kubernetesazat-com.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-kubernetesazat-com.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-kubernetesazat-com.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-kubernetesazat-com.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-kubernetesazat-com.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.us-west-2a-kubernetesazat-com.id}", "${aws_subnet.us-west-2b-kubernetesazat-com.id}", "${aws_subnet.us-west-2c-kubernetesazat-com.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-kubernetesazat-com.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-kubernetesazat-com.name}"
}

output "region" {
  value = "us-west-2"
}

output "route_table_private-us-west-2a_id" {
  value = "${aws_route_table.private-us-west-2a-kubernetesazat-com.id}"
}

output "route_table_private-us-west-2b_id" {
  value = "${aws_route_table.private-us-west-2b-kubernetesazat-com.id}"
}

output "route_table_private-us-west-2c_id" {
  value = "${aws_route_table.private-us-west-2c-kubernetesazat-com.id}"
}

output "route_table_public_id" {
  value = "${aws_route_table.kubernetesazat-com.id}"
}

output "subnet_us-west-2a_id" {
  value = "${aws_subnet.us-west-2a-kubernetesazat-com.id}"
}

output "subnet_us-west-2b_id" {
  value = "${aws_subnet.us-west-2b-kubernetesazat-com.id}"
}

output "subnet_us-west-2c_id" {
  value = "${aws_subnet.us-west-2c-kubernetesazat-com.id}"
}

output "subnet_utility-us-west-2a_id" {
  value = "${aws_subnet.utility-us-west-2a-kubernetesazat-com.id}"
}

output "subnet_utility-us-west-2b_id" {
  value = "${aws_subnet.utility-us-west-2b-kubernetesazat-com.id}"
}

output "subnet_utility-us-west-2c_id" {
  value = "${aws_subnet.utility-us-west-2c-kubernetesazat-com.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.kubernetesazat-com.cidr_block}"
}

output "vpc_id" {
  value = "${aws_vpc.kubernetesazat-com.id}"
}