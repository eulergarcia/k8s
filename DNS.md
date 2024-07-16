### Documentação importante
  * https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/
  * https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/


### external-dns
  * https://artifacthub.io/packages/helm/bitnami/external-dns
  * https://github.com/bitnami/charts/tree/master/bitnami/external-dns

```
kubectl create namespace external-dns
helm install external-dns --set provider=pdns --set pdns.apiUrl=http://172.30.240.11 --set pdns.apiKey=e725254c1c --set txtOwnerId=external-dns --set policy=sync bitnami/external-dns -n external-dns
```

