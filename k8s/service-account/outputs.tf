locals {
  kubeconfig = {
    apiVersion = "v1"
    kind       = "Config"

    users = [{
      name = kubernetes_service_account.this.metadata[0].name
      user = {
        token = kubernetes_secret.this.data["token"]
      }
    }]

    clusters = [{
      cluster = {
        certificate-authority-data = var.cluster_ca_certificate
        server                     = "https://${var.cluster_endpoint}"
      }
      name = var.cluster_name
      }
    ]

    contexts = [{
      context = {
        cluster   = var.cluster_name
        namespace = var.namespace
        user      = kubernetes_service_account.this.metadata[0].name
      }
      name = var.context
    }]

    current-context = var.context
  }
}

output "instructions" {
  value = "Copy kubeconfig value into a file, which can be directly used. e.g. `kubectl --kubeconfig kubeconfig.json get pods`"
}

output "kubeconfig" {
  sensitive = true
  value     = local.kubeconfig
}
