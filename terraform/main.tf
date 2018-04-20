module "k8s-vpc" {
  source = "./modules/vpc"

  name              = "k8s"
  vpc_cidr_block    = "10.20.0.0/16"
  vpc_dns_hostnames = "true"
  vpc_dns_support   = "true"
  subnet_map_pub_ip = "true"
}

module "etcd" {
  source = "./modules/instance-cluster"

  name           = "etcd"
  ami            = "${data.aws_ami.node_ami.id}"
  type           = "${var.node_type}"
  assign_pub_ip  = true
  ssh_key        = "${var.key_pair}"
  cluster_size   = 3
  subnet_list    = ["${module.k8s-vpc.subnet_id}"]
  sec_group_list = ["${module.k8s-vpc.default_sg_id}"]
  role           = "etcd"
}

module "nodes" {
  source = "./modules/instance-cluster"

  name           = "node"
  ami            = "${data.aws_ami.node_ami.id}"
  type           = "${var.node_type}"
  assign_pub_ip  = true
  ssh_key        = "${var.key_pair}"
  cluster_size   = 5
  subnet_list    = ["${module.k8s-vpc.subnet_id}"]
  sec_group_list = ["${module.k8s-vpc.default_sg_id}"]
  role           = "node"
}
