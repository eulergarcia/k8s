### Preparando os nós:

```
dnf install iscsi-initiator-utils
systemctl enable iscsid
systemctl start iscsid
```

```
dnf install nfs-utils
```

### Verificando requisitos do Cluster (executar no master):

```
dnf install jq
curl -sSfL https://raw.githubusercontent.com/longhorn/longhorn/v1.2.3/scripts/environment_check.sh | bash
```

### Deploy:
```
kubectl apply -f longhorn.yaml
watch kubectl get pods --namespace longhorn-system
```

### Customizações:
Definir o storageclass longhorn2 como default:
```
kubectl patch storageclass longhorn2 -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

### Leituras importântes:
  * https://longhorn.io/docs/1.2.3/high-availability/node-failure/

### Pendências: 
  * Configurar autenticação e ingress para a UI (https://longhorn.io/docs/1.2.3/deploy/accessing-the-ui/longhorn-ingress/)
  * Revisar boas práticas (https://longhorn.io/docs/1.2.3/best-practices/)

### Leituras Interessantes:
  * Utilizar tag (https://longhorn.io/docs/1.2.3/volumes-and-nodes/storage-tags/)
  * Longhorn (https://towardsdatascience.com/deploy-a-production-ready-on-premise-kubernetes-cluster-36a5d62a2109)
  * Longhorn (https://longhorn.io/)

### Leituras Pendentes:
