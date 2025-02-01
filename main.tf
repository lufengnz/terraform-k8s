module "nginx_deployment" {
  source = "./modules/module-nginx-deployment"
}

data "kubernetes_nodes" "app_web" {
  metadata {
    labels = {
      "app" = "web"
    }
  }
}

module "nginx_lb" {
  source = "./modules/module-service"
}