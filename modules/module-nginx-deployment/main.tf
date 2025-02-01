resource "kubernetes_namespace" "ns_dev" {
  metadata {
    name = var.ns_name
  }
}

resource "kubernetes_deployment" "deploy_nginx" {
  metadata {
    name      = var.deploy_name
    namespace = kubernetes_namespace.ns_dev.metadata.0.name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = var.deploy_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.deploy_name
        }
      }
      spec {
        container {
          image = var.deploy_name
          name  = var.deploy_name
          port {
            container_port = 80
          }
        }
      }
    }
  }
}