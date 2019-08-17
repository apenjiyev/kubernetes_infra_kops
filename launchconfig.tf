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