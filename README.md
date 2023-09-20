# NewTalks 2023 - Kubernetes e mais

## Configuração

> Quando há mais de uma opção, a em negrito é recomendada ;)

### Local

1. Ferramenta de conteinerização: **Docker** ou [Podman][podman-inst]
2. Cluster Kubernetes local: Kind ou [**Minikube**][minikube-inst]
3. [Mais informações][k8s-installation]

### Cloud

1. Você pode usar um cluster provisionado em cloud ([AWS][eks], [Oracle][oke], [Google][gke], [DigitalOcean][doks], **[Azure][aks]**, [IBM][ibm-k8s]) ou [criar um cluster manualmente][kubeadm-cluster]
2. [Azure CLI][azure-cli]

## Por que usar a Azure Kubernetes Service (AKS)?

Dentre as cloud alternativas, é a única que não tem taxa de administração (ainda assim, apenas no tier free. [Mais informações aqui][aks-pricing]).

> **CUIDADO: Você PODE ser cobrado por executar estes exemplos na Azure Cloud, ou em qualquer outra na real**

## Referências

* [Learn Kubernetes Basics][k8s-tutorial];
* [Kubeconfig explained][kubeconfig-explained];
* [K8s services][k8s-services]
  * [more here](https://cloud.google.com/kubernetes-engine/docs/how-to/exposing-apps)
* [Azure K8s series](https://apgapg.medium.com/azure-kubernetes-part-2-expose-a-service-to-outside-world-54319dc39460)
* [Kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#updating-resources)

## Notas

* shell é terrível. Talvez usar [NGS](https://ngs-lang.org/)?

[k8s-services]: https://kubernetes.io/docs/concepts/services-networking/service/
[kubeconfig-explained]: https://www.redhat.com/sysadmin/kubeconfig
[azure-cli]: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
[gke]: https://cloud.google.com/kubernetes-engine
[oke]: https://www.oracle.com/br/cloud/cloud-native/container-engine-kubernetes/
[aks]: https://azure.microsoft.com/en-us/products/kubernetes-service
[doks]: https://www.digitalocean.com/products/kubernetes
[ibm-k8s]: https://www.ibm.com/cloud/kubernetes-service
[eks]: https://aws.amazon.com/kubernetes/
[kubeadm-cluster]: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
[aks-pricing]: https://azure.microsoft.com/en-us/pricing/details/kubernetes-service/
[k8s-tutorial]: https://kubernetes.io/docs/tutorials/kubernetes-basics/
[k8s-installation]: https://kubernetes.io/docs/tasks/tools/
[minikube-inst]: https://minikube.sigs.k8s.io/docs/start/
[podman-inst]: https://podman.io/docs/installation