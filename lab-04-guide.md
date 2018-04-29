# Kubernetes hands-on lab

_These instructions assume you've completed the previous hands-on labs._

1. In the `ansible` subdirectory, run `python ec2.py --list` and make a note of the IP address of the first EC2 instance in the "tag_role_node" group.

2. SSH to the IP address identified in step 1. Use the SSH key specified in `terraform.tfvars` (from the Terraform lab), and log in as the "ubuntu" user.

3. Run `sudo kubeadm init`. This will use `kubeadm` to bootstrap the first node in a Kubernetes cluster.

4. When `kubeadm` finishes running, copy the `kubeadm` command that it provides on the screen. Paste it somewhere else; you'll need it in a few minutes.

5. Follow the instructions on the screen to create a `~/.kube` directory and copy the necessary configuration file into it. This will allow you to run `kubectl`.

6. Run `kubectl get nodes`. You should see a single node, whose status is listed as "NotReady".

7. Run `kubectl -n kube-system get pods`. Depending on how quickly the system is moving, you should see several pods being spun up.

8. Run `watch kubectl -n kube-system get pods` to monitor the progress of the master node you're bootstrapping. When all the pods are running, press Ctrl+C to break out of that command and move to the next step.

9. Run `kubectl apply -f https://docs.projectcalico.org/v2.1/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml` to install Calico for pod networking.

10. Repeat step 8 and proceed when all pods are running.

11. Log out of that system and SSH to a different EC2 instance (all the IP addresses can be obtained from the EC2 dynamic inventory script you ran in step 1).

12. Run the `kubeadm` command you copied in step 4. You'll need to use `sudo` in front of that command.

13. Repeat steps 11 and 12 on all remaining nodes.

14. Log into the first node (using the IP address identified in step 1) and run `kubectl get nodes`. You should see several nodes listed, some as "Ready" and some as "NotReady". Feel free to use the `watch` command to monitor the progress of the additional nodes.

15. When all nodes are listed as "Ready", you're finished! You've successfully turned up a Kubernetes cluster.

Once you've reached this point, return to the Terraform lab to perform the last couple steps to tear down your AWS infrastructure.
