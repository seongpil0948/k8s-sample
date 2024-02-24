# sudo kubeadm config images pull --cri-socket=unix:///var/run/crio/crio.sock
sudo kubeadm init \
  --pod-network-cidr=192.168.0.0/16 \
  --cri-socket=unix:///var/run/crio/crio.sock