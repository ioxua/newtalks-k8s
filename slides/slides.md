---
# theme: seriph
theme: apple-basic
background: https://source.unsplash.com/oA7MMRxTVzo/1920x1080
class: text-center
highlighter: shiki
lineNumbers: true
drawings:
  persist: false
transition: slide-left
# title: Escalando aplicações com K8S e mais!
mdc: true

# see https://sli.dev/builtin/layouts.html#default
hideInToc: true
layout: intro
---
# Subindo aplicações escaláveis em produção

Uma curta introdução a Docker, Kubernetes e Terraform

<!-- <div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    Pressione <kbd>Espaço</kbd> <carbon:arrow-right class="inline"/>
  </span>
</div> -->

<div class="absolute bottom-10">
  <span class="font-700">
    Com Yehoshua Oliveira
  </span>
</div>

<div class="abs-br m-6 flex gap-2">
  <a href="https://github.com/ioxua/newtalks-k8s" target="_blank" alt="GitHub"
    class="text-xl slidev-icon-btn opacity-50 !border-none !hover:text-white">
    <carbon-logo-github />
  </a>
</div>

---
layout: image-right
image: '/ioxua.br.svg'
backgroundSize: contain
---

# Quem?

- Ex-sócio da NewGo, agora Arquiteto Corporativo na GOL;
- ~6 anos de desenvolvimento;
- Leciona um [Curso de Verão no IME][verao-ime];
- Formando em ADS na Fatec MC;
- [ioxua.com][auto-promotion]

[verao-ime]: https://www.ime.usp.br/verao/index.php
[auto-promotion]: https://ioxua.com

---

# Nosso boneco de testes

* Um microsserviço Spring + Kotlin;
* Spring Actuator para que possamos simular quebras;

```kotlin {all|3|1-2|4-5|6-7|10-16|all}
@RestController
@RequestMapping(produces = [MediaType.APPLICATION_JSON_VALUE])
class DemoController {
  @GetMapping("/")
  fun index(@RequestParam(value = "name", required = false) name: String?): Map<String, String> {
    val value = name ?: "world"
    return mapOf("message" to "Hello, $name!")
  }

  @GetMapping("/env")
  fun env(): Map<String, String> {
    return mapOf(
      "mySecret" to System.getenv("MY_SECRET"),
      "apiUrl" to System.getenv("API_URL"),
    )
  }
}
```

---

<style>
  .slidev-layout li ul {
    margin: 0;
  }
</style>

# Docker?

- Uma plataforma de _conteinerização_;
- [Arquitetura][docker-arch]
- Open Source + soluções cloud:
  - Docker Hub
  - Docker Pro
- Alternativas: [Podman][podman], [Buildah][buildah], entre outros

## O contêiner

- "pacote de software com todas as dependências necessárias para executar uma aplicação"
- [Não são máquinas virtuais][cont-vs-virt]
- Dockerfile -> imagem (imutável, versionada) -> contêiner
- Container Registry

[docker-arch]:https://docs.docker.com/get-started/overview/#docker-architecture
[buildah]: https://github.com/containers/buildah/tree/main
[podman]: https://podman.io/
[cont-vs-virt]: https://www.aquasec.com/cloud-native-academy/docker-container/containerization-101/

---

# Dockerfile

- a.k.a. [Containerfile][open-cont-init]
- [Referência][dockerfile-ref]

```dockerfile {all|2|3|4|5|all}
# app/Dockerfile
FROM openjdk:20-ea-4-jdk
COPY build/libs/demo-0.0.1-SNAPSHOT.jar app.jar
RUN ["echo", "-n", "'arbitrary commands'"]
ENTRYPOINT ["java", "-jar", "/app.jar"]
```

[dockerfile-ref]: https://docs.docker.com/engine/reference/builder/
[open-cont-init]: https://opencontainers.org/

---
layout: image
image: /docker_cmds.svg
backgroundSize: contain
---
---
hideInToc: true
---

# Demonstração 1

```shell {all|1|2|3|4|all}
cd app && ./gradlew clean build
docker build -t meu-app:latest
docker push meu-app:latest
ssh <ip-servidor> && docker run -p 8080:8080 -it meu-app:latest
```

---
hideInToc: true
---

# O que temos até agora

- Aplicação conteinerizada, porém gerenciada manualmente;
- Melhorias possíveis:
  - Escalonamento;
  - Resiliência;
  - Infraestrutura adicional: Load balancers, por exemplo.
- De forma geral, _orquestração_.

---
---

# Kubernetes (K8s)

- Uma plataforma open source para gerenciamento de aplicações e serviços _conteinerizados_
- Funcionalidades:
  - Escalonamento;
  - Resiliência;
  - Infraestrutura adicional (em cloud);
  - Segredos;
  - Configuração chave-valor;
  - _Jobs_ efêmeros.
  - Extensível a partir da implementação de [Controladores][k8s-ctrl] e [Recursos Customizados][k8s-cust-res]:
    - [Deploy Blue/Green ou Canary com Argo Rollouts][argo-rollouts]
    - [Gerenciamento automatizado de certificados com Cert Manager][k8s-cert-mang]
    - [E mais][awesome-k8s-res]

[awesome-k8s-res]: https://github.com/tomhuang12/awesome-k8s-resources
[k8s-cert-mang]: https://cert-manager.io/
[k8s-cust-res]: https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/
[k8s-ctrl]: https://kubernetes.io/docs/concepts/architecture/controller/
[argo-rollouts]: https://argoproj.github.io/argo-rollouts/

---
layout: image
image: /k8s_components.svg
backgroundSize: contain
---

<div class="absolute bottom-10">
  <a href="https://kubernetes.io/docs/concepts/overview/">
    Fonte
  </a>
</div>

---
---

## O Cluster

- Pode ser configurado manualmente com [kubeadm][kubeadm]
- Ou provisionado automaticamente em (quase) qualquer provedor cloud:

|**Provedor**|**Serviço**|**Abrev.**|
|:--|:--|:--|
|Microsoft Azure|Azure K8s Services|[AKS][aks]|
|Amazon Web Services|Elastic K8s Service|[EKS][eks]|
|Oracle Cloud Infrastructure|Container Engine for K8s|[OKE][oke]|
|Google Cloud|Google K8s Engine|[GKE][gke]|
|DigitalOcean|DigitalOcean K8s|[DOKS][doks]|
|IBM Cloud|K8s Service|[IBMKS][ibm-k8s]|

[gke]: https://cloud.google.com/kubernetes-engine
[oke]: https://www.oracle.com/br/cloud/cloud-native/container-engine-kubernetes/
[aks]: https://azure.microsoft.com/en-us/products/kubernetes-service
[doks]: https://www.digitalocean.com/products/kubernetes
[ibm-k8s]: https://www.ibm.com/cloud/kubernetes-service
[eks]: https://aws.amazon.com/kubernetes/
[kubeadm]: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

---
hideInToc: true
---

## O Cluster (cont.)

- Pode-se interagir via API ou CLI ([kubectl][kubectl]);
- Clusters locais: [Kind][kind-k8s] ou [Minikube][minikube];
- [Cada cluster pode emitir um arquivo][kubeconf] `kubeconfig.yaml`:
  - `~/.kube/config`
  - Variável de ambiente: `$KUBECONFIG`
  - Flag `--kubeconfig`
- Elementos configuráveis:
  - [Controladores][kube-ctrl] (responsáveis por manter o estado desejado do cluster)
  - [Recursos][kube-res] (determinam o estado desejado do cluster em arquivos YAML):
    - [Pods][k8s-pods];
    - [Services][k8s-services];
    - [Deployments][k8s-depl];
    - [Jobs/Cronjobs][k8s-job].

[k8s-job]: https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/
[k8s-depl]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
[k8s-pods]: https://kubernetes.io/docs/concepts/workloads/
[k8s-services]: https://kubernetes.io/docs/concepts/services-networking/
[kind-k8s]: https://kind.sigs.k8s.io/
[minikube]: https://minikube.sigs.k8s.io/docs/start/
[kube-res]: https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/#organizing-resource-configurations
[kube-ctrl]: https://kubernetes.io/docs/concepts/architecture/controller/
[kubeconf]: https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/
[kubectl]: https://kubernetes.io/docs/tasks/tools/

---

```yaml {all|3|4-5|7|11-20|21-22|all}
# meu-recurso.yaml
apiVersion: v1
kind: Pod
metadata:
  name: demo-simple-pod
spec:
  replicas: 3
  selector:
    matchLabels:
      app: demo-app
  template:
    metadata: { labels: { app: { demo-app } } }
    spec:
      containers:
      - name: newtalks-k8s-backend
        image: ghcr.io/ioxua/newtalk-k8s-demo:latest
        resources:
          requests: { memory: 100Mi, cpu: 250m }
          limits: { memory: 200Mi, cpu: 500m }
        ports: [{ containerPort: 8080 }]
# ---
# outro recurso poderia estar aqui
```

---
---

# Terraform

- Ferramenta de infraestrutura-como-código;
- Utiliza a linguagem [HCL][hcl]
- Módulos terceiros para uma [GRANDE variedade de provedores][tf-providers]:
- +git provê versionamento, auditoria e governança;
- [Referência][tf-ref]

[hcl]: https://github.com/hashicorp/hcl
[tf-providers]: https://registry.terraform.io/browse/providers
[tf-ref]: https://developer.hashicorp.com/terraform/cli
---
layout: image
image: /terraform_ov.svg
backgroundSize: contain
---
---
---

```hcl {all|2-4|6-9|all}
# main.tf
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "demo-res" {
  name     = "newtalks-k8s-demo-resources"
  location = "Brazil South"
}
```

---
---

# Demonstração 2

```shell {all|1|2|3|4|5|all}
terraform init
terraform plan
terraform apply
terraform output -raw kube_config > ./kubeconfig.yaml
kubectl apply -f simple-pod.yaml --kubeconfig ./kubeconfig.yaml
```

---

# Leituras recomendadas

- [Kubernetes sem Docker? – Entendendo OCI, CRI e o ecossistema de containers][[lsantos-ecosystem](https://blog.lsantos.dev/oci-cri-docker-ecossistema-de-containers/)];
- [K8s concepts](https://kubernetes.io/docs/concepts/);
- [Aquasec CNW: What is a container?](https://www.aquasec.com/cloud-native-academy/docker-container/what-is-a-container/);
- [Azure Kubernetes Series](https://apgapg.medium.com/azure-kubernetes-part-1-deploy-an-image-f36fe76c99f7);

---
layout: cover
---

# Obrigado :D