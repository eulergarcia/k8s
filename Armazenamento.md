### Preparando o Cluster:
https://mayastor.gitbook.io/introduction/quickstart/preparing-the-cluster
```
grep HugePages /proc/meminfo
echo "vm.nr_hugepages = 1024" > /etc/sysctl.d/mayastor.conf
grep HugePages /proc/meminfo
```
### Deploy:
https://mayastor.gitbook.io/introduction/quickstart/deploy-mayastor
```
kubectl label node srv-node01 openebs.io/engine=mayastor
kubectl label node srv-node02 openebs.io/engine=mayastor
kubectl create namespace mayastor
kubectl create -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/moac-rbac.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/csi/moac/crds/mayastorpool.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/nats-deployment.yaml
kubectl -n mayastor get pods --selector=app=nats
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/etcd/statefulset.yaml 
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/etcd/svc.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/etcd/svc-headless.yaml
kubectl -n mayastor get pods --selector=app.kubernetes.io/name=etcd
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/csi-daemonset.yaml
kubectl -n mayastor get daemonset mayastor-csi
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/moac-deployment.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/moac-deployment.yaml
kubectl get pods -n mayastor --selector=app=moac
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/mayastor-daemonset.yaml
kubectl -n mayastor get daemonset mayastor
kubectl -n mayastor get msn
kubectl -n mayastor get msn

```

###
  * Longhorn (https://towardsdatascience.com/deploy-a-production-ready-on-premise-kubernetes-cluster-36a5d62a2109)
  * Longhorn (https://longhorn.io/)
  * https://openebs.io/
  * Freenas
  * Ceph

### Leituras Pendentes:
  * https://blog.mayadata.io/openebs/mayastor-crossing-the-chasm-to-nvmf-infinity-and-beyond
  * https://blocksandfiles.com/2021/03/08/intel-says-mayastor-is-fastest-open-source-storage/

### Leituras Realizadas: 
  * https://medium.com/volterra-io/kubernetes-storage-performance-comparison-v2-2020-updated-1c0b69f0dcf4

### NFS:
```
dnf install nfs-utils
systemctl start nfs-server
systemctl enable nfs-server
systemctl status nfs-server

```

