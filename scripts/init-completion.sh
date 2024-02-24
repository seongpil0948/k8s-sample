# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#enable-shell-autocompletion
sudo dnf update -y
sudo dnf install -y bash-completion

# system wide set
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
sudo chmod a+r /etc/bash_completion.d/kubectl
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc