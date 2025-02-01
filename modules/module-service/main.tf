resource "kubernetes_service" "terraform_np" {
  metadata {
    name = "nginxnp"
  }
  spec {
    selector = {
      app = var.deploy_name
    }
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

