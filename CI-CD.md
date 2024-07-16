### Helm

### Jenkins
  * https://docs.gitea.io/en-us/

### GitLab
  * https://docs.gitlab.com/ee/ci/quick_start/
  * https://docs.gitlab.com/charts/quickstart/index.html

```
kubectl create namespace gitlab
helm repo add gitlab https://charts.gitlab.io
helm install gitlab gitlab/gitlab \
  --set global.hosts.domain=cloud.teste.net.br \
  --set certmanager-issuer.email=cor@teste.net.br \
  --namespace gitlab
```

### Configurações
  * https://docs.gitlab.com/charts/charts/globals.html
  * https://gitlab.com/gitlab-org/charts/gitlab/-/blob/master/doc/installation/command-line-options.md#email-configuration
  * https://gitlab.com/gitlab-org/charts/gitlab/-/blob/master/doc/installation/secrets.md#smtp-password
```
kubectl get ingress -lrelease=gitlab -n gitlab
kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' -n gitlab | base64 --decode ; echo
```

### SMTP
```
# kubectl create secret generic smtp-password -n gitlab --from-literal=password=12345
kubectl create -f gitlab/secret-smtp-password.yaml
helm upgrade gitlab gitlab/gitlab --namespace gitlab -f helm-gitlab.yaml
```


```
kubectl create secret generic gitlab-gitlab-kas-secret --from-literal=kas_shared_secret=$(head -c 512 /dev/urandom | LC_CTYPE=C tr -cd 'a-zA-Z0-9' | head -c 32 | base64) -n gitlab
```



### Interessante: 
  * https://landscape.cncf.io/card-mode?category=continuous-integration-delivery&grouping=category
