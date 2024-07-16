

### Pendencias:
  * Configurar o Ingress (https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/)
  * ArgoCD polls git repo evert 3 minutes. To change configure a git webhook;

### Conceitos:
  * Application 

    Um grupo de recursos do Kubernetes conforme definido por um manifesto. Esta é uma definição de recurso personalizado (CRD).

  * Application source type

    Qual ferramenta é usada para construir o aplicativo.

  * Target state 
    
    O estado desejado de um aplicativo, conforme representado por arquivos em um repositório Git.

  * Live state 
    
    O estado ativo desse aplicativo. Quais pods etc são implantados.

  * Sync status 
  
    Se o estado ativo corresponde ou não ao estado de destino. O aplicativo implantado é o mesmo que o Git diz que deveria ser?

  * Sync 
  
    O processo de fazer com que um aplicativo se mova para seu estado de destino. Por exemplo, aplicando alterações em um cluster Kubernetes.

  * Sync operation status 
      
    Se uma sincronização foi bem-sucedida ou não.

  * Refresh 
  
    Compare o código mais recente no Git com o estado ativo. Descubra o que é diferente.

  * Health
  
    A saúde do aplicativo, está funcionando corretamente? Ele pode atender a pedidos?

  * Tool 

    Uma ferramenta para criar manifestos de um diretório de arquivos. Por exemplo, Kustomize ou Ksonnet. Consulte Tipo de origem do aplicativo .

  * Configuration management tool
  
    Consulte Ferramenta .

  * Configuration management plugin 
  
    Uma ferramenta personalizada.