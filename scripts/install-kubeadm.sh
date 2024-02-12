# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
# apt 패키지 색인을 업데이트하고, 쿠버네티스 apt 리포지터리를 사용하는 데 필요한 패키지를 설치한다.
sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

# 구글 클라우드의 공개 사이닝 키를 다운로드 한다.
# Download the public signing key for the Kubernetes package repositories. The same signing key is used for all repositories so you can disregard the version in the URL:
sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# 쿠버네티스 apt 리포지터리를 추가한다.
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
# https://velog.io/@dldbwls492/unable-to-locate-package-kubeadm-kubelet-kubectl-kubernetes-cni-error
# echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list  
echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list  
sudo apt-get update

# apt 패키지 색인을 업데이트하고, kubelet, kubeadm, kubectl을 설치하고 해당 버전을 고정한다.
sudo apt-get install -y kubelet kubeadm kubectl
# 보류 상태로 설정된 패키지는 자동 업데이트되지 않습니다.
sudo apt-mark hold kubelet kubeadm kubectl

sudo swapoff -a && sudo sed -i '/swap/s/^/#/' /etc/fstab
sudo sudo mv /etc/containerd/config.toml /etc/containerd/config.bak.toml 
sudo systemctl restart containerd

sudo kubeadm init --pod-network-cidr=192.168.0.0/16
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.4/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.4/manifests/custom-resources.yaml