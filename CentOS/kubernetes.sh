#!/bin/bash
yum install yum-utils google-chrome-stable -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum remove runc -y
yum install -y docker-ce docker-ce-cli containerd.io -y
systemctl start docker
systemctl enable docker
yum-config-manager --add-repo https://raw.githubusercontent.com/ivanuchi22/kubernetes/main/CentOS/kubernetes.repo
yum update -y
yum install kubelet kubeadm kubectl --disableexcludes=kubernetes -y
systemctl enable --now kubelet
mkdir -p /etc/containerd
containerd config default | tee /etc/containerd/config.toml
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml
systemctl restart containerd
systemctl enable containerd
