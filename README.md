# NewTalks 2023 - Kubernetes e mais

## Instalação

> Quando há mais de uma opção, a em negrito é recomendada ;)

### Local

1. Ferramenta de conteinerização: **Docker** ou [Podman][podman-inst]
2. Cluster Kubernetes local: Kind ou [**Minikube**][minikube-inst]
3. [Mais informações][k8s-installation]

### Em produção

* você pode usar um cluster provisionado em cloud ou [criar um cluster manualmente][kubeadm-cluster]

## Por que usar AKS?

Dentre as cloud alternativas (AWS, GCP, OCI), é a única que não tem taxa de administração (ainda assim, apenas no tier free. [Mais informações aqui][aks-pricing]).

> **CUIDADO: Você PODE ser cobrado por executar estes exemplos na Azure Cloud**

## Referências

* [Learn Kubernetes Basics][k8s-tutorial];

[kubeadm-cluster]: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
[aks-pricing]: https://azure.microsoft.com/en-us/pricing/details/kubernetes-service/
[k8s-tutorial]: https://kubernetes.io/docs/tutorials/kubernetes-basics/
[k8s-installation]: https://kubernetes.io/docs/tasks/tools/
[minikube-inst]: https://minikube.sigs.k8s.io/docs/start/
[podman-inst]: https://podman.io/docs/installation