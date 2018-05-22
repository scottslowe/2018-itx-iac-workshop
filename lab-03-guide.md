# Ansible demo and hands-on lab

_Prerequisites: Ansible installed on your system; all of the Terraform hands-on lab completed_

_These instructions assume you've completed at least steps 1 through 7 of the Git hands-on lab (i.e., that you have a cloned copy of the repository on your local computer) and all of the steps in the Terraform lab **except** the last 2 steps (which you should wait to complete after this lab)._

1. Change into the directory where Git cloned the repository, then change into the `ansible` subdirectory.

2. Run `python ec2.py --list` to list the EC2 instances detected by the Ansible EC2 dynamic inventory module.

3. Review the output of the dynamic inventory module. What sort of information does the module provide? Why is this important?

4. Run `ansible-playbook playbook.yml` to run Ansible against the EC2 instances created by Terraform in the previous lab.

5. Note how when Ansible was running, some tasks reported back "OK" (in green) while other tasks reported back "changed" (in yellow/orange). Make a note of the changed tasks.

6. When Ansible is finished running, SSH into one of the EC2 instances. 

7. Take a moment to try to verify the changes made by one of the tasks that reported back as "changed".

8. Repeat step 3. Did any tasks report back as "changed" this time? Which tasks? Why?

At this point, you can proceed with the (optional) fourth lab, which will help you turn up a Kubernetes cluster, or you can return to the Terraform lab to tear down your infrastructure.
