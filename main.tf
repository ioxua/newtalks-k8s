terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resources ======
# See https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster

resource "azurerm_resource_group" "demo-res" {
  name     = "newtalks-k8s-demo-resources"
  location = "Brazil South"
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster
resource "azurerm_kubernetes_cluster" "demo-cluster" {
  name                = "newtalks-k8s-demo-cluster2"
  location            = azurerm_resource_group.demo-res.location
  resource_group_name = azurerm_resource_group.demo-res.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

# Outputs ===

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.demo-cluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.demo-cluster.kube_config_raw
  sensitive = true
}