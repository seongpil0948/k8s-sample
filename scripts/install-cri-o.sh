

sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo \
  https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/CentOS_9_Stream/devel:kubic:libcontainers:stable.repo
  
sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable:cri-o:1.24.0.repo \
  https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/1.24:/1.24.0/CentOS_8_Stream/devel:kubic:libcontainers:stable:cri-o:1.24:1.24.0.repo
sudo yum install cri-o
