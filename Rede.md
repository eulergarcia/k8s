### Install Calico:
```
kubectl create -f install-01-tigera-operator.yaml
kubectl create -f install-02-custom-resources.yaml

calicoctl create -f bgp-01-bgpconfiguration.yaml
calicoctl create -f bgp-02-peer-tor.yaml
```

### Metallb:
```
kubectl create -f metallb.yaml
```

### Comandos Úteis:
calicoctl get ippool -o wide
calicoctl get workloadendpoints --all-namespaces
calicoctl get bgpConfiguration
calicoctl get bgpPeer
calicoctl get felixConfiguration
calicoctl get globalNetworkPolicy
calicoctl get globalNetworkSet
calicoctl get hostEndpoint
calicoctl get ipReservation
calicoctl get kubeControllersConfiguration
calicoctl get networkSet
calicoctl get node
calicoctl get profile

### Install Docs:
  * https://projectcalico.docs.tigera.io/getting-started/kubernetes/quickstart
  * https://projectcalico.docs.tigera.io/reference/installation/api

### Assuntos Pendentes:
  * MTU (https://projectcalico.docs.tigera.io/networking/mtu)
  * kube-proxy: --proxy-mode = iptables ou ipvs (https://projectcalico.docs.tigera.io/networking/use-ipvs)
  * Separar IP por label (https://projectcalico.docs.tigera.io/networking/assign-ip-addresses-topology)
  
### Leituras Pendentes:
  * Personalize o gerenciamento de endereços IP (https://projectcalico.docs.tigera.io/networking/ipam)
  * Configuring Route Reflectors in Calico for Kubernetes (https://www.youtube.com/watch?v=gxzLrgsKhBw)  
  * Understanding Kubernetes Networking Part 3 (https://www.youtube.com/watch?v=vOo__3GqyxM)

### Concluído:
  * Instalar MetalLB (https://projectcalico.docs.tigera.io/networking/advertise-service-ips)

### Interessante
  * Traefik (https://www.disasterproject.com/kubernetes-with-external-dns/)

### Referências: 
  * Buld MetalLB (https://www.datapacket.com/blog/build-kubernetes-cluster)
  * https://developers.caffeina.com/kubernetes-on-premise-8ceffa48fee5
  * Como a rede funciona em um ambiente kubernetes (https://medium.com/google-cloud/understanding-kubernetes-networking-pods-7117dd28727)
  * Experiência de uso (https://devsres.com/marcelo/blog/kubernetes-on-prem-2/)
  * Benchmark (https://itnext.io/benchmark-results-of-kubernetes-network-plugins-cni-over-10gbit-s-network-updated-august-2020-6e1b757b9e49)
  * https://jvns.ca/blog/2017/10/10/operating-a-kubernetes-network/
  * https://www.youtube.com/watch?v=y2bhV81MfKQ
  * https://www.youtube.com/watch?v=4-pawkiazEg
  * https://blog.sophaskins.net/blog/misadventures-with-kube-dns/
  * Calico Routing Modes: IP-in-IP, Direct, VXLAN (https://www.youtube.com/watch?v=MpbIZ1SmEkU)
