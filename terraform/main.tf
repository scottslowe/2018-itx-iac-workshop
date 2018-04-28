module "k8s-vpc" {
  source = "./modules/vpc"

  name              = "k8s"
  vpc_cidr_block    = "10.20.0.0/16"
  vpc_dns_hostnames = "true"
  vpc_dns_support   = "true"
  subnet_map_pub_ip = "true"
}

resource "aws_security_group" "k8s_sg" {
  name        = "k8s_sg"
  description = "Allow traffic needed by Kubernetes"
  vpc_id      = "${module.k8s-vpc.vpc_id}"
}

resource "aws_security_group_rule" "k8s_sg_allow_sg_in" {
  security_group_id        = "${aws_security_group.k8s_sg.id}"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "${aws_security_group.k8s_sg.id}"
}

resource "aws_security_group_rule" "k8s_sg_allow_sg_out" {
  security_group_id = "${aws_security_group.k8s_sg.id}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "k8s_sg_allow_apiserver" {
  security_group_id = "${aws_security_group.k8s_sg.id}"
  type              = "ingress"
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

module "k8s-node" {
  source = "./modules/instance-cluster"

  name           = "k8s"
  ami            = "${data.aws_ami.node_ami.id}"
  type           = "${var.node_type}"
  assign_pub_ip  = true
  ssh_key        = "${var.key_pair}"
  cluster_size   = 5
  subnet_list    = ["${module.k8s-vpc.subnet_id}"]
  sec_group_list = ["${module.k8s-vpc.default_sg_id}", "${aws_security_group.k8s_sg.id}"]
  role           = "node"
}
