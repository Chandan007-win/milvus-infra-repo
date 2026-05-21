resource "kubernetes_manifest" "milvus_argocd_application" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"

    metadata = {
      name      = "milvus-dev"
      namespace = "argocd"
    }

    spec = {
      project = "default"

      sources = [
        {
          repoURL        = "https://zilliztech.github.io/milvus-helm/"
          chart          = "milvus"
          targetRevision = "4.2.49"

          helm = {
            valueFiles = [
              "$values/milvus/values-dev.yaml"
            ]
          }
        },
        {
          repoURL        = var.app_repo_url
          targetRevision = "dev"
          ref            = "values"
        }
      ]

      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = var.milvus_namespace
      }

      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }

        syncOptions = [
          "CreateNamespace=true"
        ]
      }
    }
  }

  depends_on = [
    helm_release.argocd
  ]
}
