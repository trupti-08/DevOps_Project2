# 🚀 Project Overview

This project automates the deployment, scaling, and management of containerized applications using Docker, Kubernetes, Jenkins, and Terraform. Below is a step-by-step guide.

# 🎯 Project Objective

- Automate deployment, scaling, and management of containerized applications.

- Implement Git workflow, Jenkins CI/CD pipeline, Docker, and Kubernetes deployment.

- Use Terraform for infrastructure provisioning on AWS.

- Configure servers using Ansible for required software.

# 🔗 Project Repository

GitHub Repo: [website.git](https://github.com/hshar/website)

# 📁 Project Architecture

1.**GitHub Repository:** Hosts the application source code.

2.**Jenkins:** Triggers CI/CD pipelines and manages automated builds.

3.**Docker:** Containerizes the application using a custom Dockerfile.

4.**Docker Hub:** Stores custom-built Docker images.

5.**Kubernetes Cluster:** Manages containerized applications with 2 replicas.

6.**Terraform:** Provisions AWS infrastructure.

7.**Ansible:** Configures necessary software on respective machines.

# 🔄 Project Implementation

**1️⃣ Create an AWS EC2 Instance Manually**

- Launch an EC2 instance (Ubuntu 22.04 or Amazon Linux 2) manually for Machine-1.

- Assign a public IP and security group allowing necessary ports (22, 8080, 30008).

**2️⃣ Install Terraform on Instance (Machine-1)**

Connect to the instance using SSH.

Install Terraform:[Terraform_Install.sh]()

**3️⃣ Run Terraform Script to Create Other Three Instances**

- Create a Terraform script [main.tf]() to provision:

    - 3 additional EC2 instances.

    - Security groups and IAM roles.

- Run Terraform commands:
  
    - terraform init
    - terraform plan
    - terraform apply

- Verify that instances are created successfully.

**4️⃣ Install Ansible on Machine-1 (Main)**

- Install Ansible:[Ansible_Install.sh]()

**5️⃣ Paste Private IP Addresses of Slaves in the Hosts File**

- Edit the Ansible inventory file: sudo nano /etc/ansible/hosts
  
  [Ansible_Inventory]()

**6️⃣ Create Three Scripts for Installing Required Tools on Machines**

- Create the following scripts:

  - [jenkins_install.sh]() → Install Jenkins and Java on Worker1.

  - [docker_k8_install.sh]() → Install Docker and Kubernetes on Worker2 and Worker4.

  - [install_java_docker_k8s.sh]() → Install Java, Docker, and Kubernetes on Worker3.

**7️⃣ Create Ansible Playbooks to Run These Scripts**

- Create playbooks [ansible-playbook.yml]() to execute the installation scripts:

- Run the playbook:

  - ansible-playbook -i /etc/ansible/hosts ansible-playbook.yml
**8️⃣ Configure Kubernetes Slaves on Machine-3**

- Initialize Kubernetes master on Machine-3:

  - sudo kubeadm init

- Configure kubectl:

  - mkdir -p $HOME/.kube
  - sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

- Add worker nodes using the kubeadm join command.

**9️⃣ Configure Jenkins Setup on Machine-1**

- Access Jenkins on http://<public_ip>:8080

- Unlock Jenkins and install recommended plugins.

- Configure Docker and Kubernetes plugins for Jenkins.

**🔟 Add Kubernetes Master (Machine-3) as a Node in Jenkins**

- Configure Kubernetes in Jenkins by adding Machine-3 as a node.

- Add Kubernetes credentials and Docker Hub credentials.

**1️⃣1️⃣ Create DockerHub Credentials for Jenkins Pipeline**

- Create Docker Hub credentials in Jenkins:

  - Username: <dockerhub-username>

  - Password: <dockerhub-password>

**1️⃣2️⃣ Fork the GitHub Repository in Your Account**

- Fork the project repo: [website.git](https://github.com/hshar/website)

- Clone it to your local machine for modifications.

**1️⃣3️⃣ Create a Dockerfile in the GitHub Repository**

- Add a Dockerfile to the root directory:[Dockerfile](Dockerfile)

- Commit and push changes to the repository.

**1️⃣4️⃣ Create Jenkins Pipeline to Automate Tasks**

**1️⃣5️⃣ Automate Pipeline Using GitHub Webhooks**

- Configure GitHub Webhook to trigger Jenkins pipeline.

- Add webhook URL in GitHub:

  - (http://<jenkins-ip>:8080/github-webhook/)
 
**1️⃣6️⃣ Do Changes and Test the Pipeline**

- Make changes to the application and commit them to the GitHub repository.

- Verify that Jenkins pipeline triggers and executes automatically.




