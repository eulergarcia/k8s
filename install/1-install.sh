if [ -z $1 ]; then 
  echo "Set Hostname"
  exit
fi

echo $1 > /proc/sys/kernel/hostname
echo $1 > /etc/hostname

sed -i '/ swap / s/^/#/' /etc/fstab
swapoff -a

apt update && apt -y upgrade
apt-get install -y sudo
apt-get install -y vim
apt-get install -y init
apt-get install -y gpg
apt-get install -y net-tools
apt-get install -y curl
apt-get install -y ca-certificates
apt-get install -y apt-transport-https
apt-get install -y iptables
apt-get install -y gnupg2
apt-get install -y containerd

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list
apt update
apt install -y kubelet kubeadm kubectl

cat > /etc/sysctl.d/99-k8s-cri.conf <<EOF
net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-ip6tables=1
net.ipv4.ip_forward=1
EOF

modprobe overlay; modprobe br_netfilter
echo -e overlay\\nbr_netfilter > /etc/modules-load.d/k8s.conf

echo 1 | update-alternatives --config iptables
ln -s /opt/cni/bin /usr/lib/cni

sysctl --system

mkdir -p /etc/containerd
containerd config default>/etc/containerd/config.toml
sed -e 's/SystemdCgroup = false/SystemdCgroup = true/g' -i /etc/containerd/config.toml
systemctl restart containerd