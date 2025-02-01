output "linux-node-names" {
  value = [for node in data.kubernetes_nodes.app_web.nodes : node.metadata.0.name]
}