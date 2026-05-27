# Summary

This is a sandbox for exploring various software tools and principles. It currently hosts a Blazor Web Assembly project designed for claims management at an arbitrary insurance company.

>[!Note]
>Some tools serve the same function. Files are kept centralized to simplify context switching.

>[!Warning]
>Portions of this workspace have been omitted. See SECURITY.md for more details.

## App - Blazor WebAssembly

<div style="display: flex; overflow-x: auto; gap: 10px;">
  <img src="imgs/claims.png" width="auto" />
</div>

## Workspace Structure

```text
.
├── github
│   ├── workflows
├── imgs
├── infra
│   ├── helm
│   │   └── templates
│   ├── k8s
│   ├── security
│   └── terraform
│       ├── dev
│       ├── prod
│       └── staging
├── ops
└── src
    ├── Client
    │   ├── Pages
    │   ├── Properties
    │   ├── Services
    │   ├── Shared
    │   └── wwwroot
    ├── Server
    │   ├── Controllers
    │   ├── Data
    │   ├── Mapping
    │   ├── Pages
    │   ├── Properties
    │   ├── cert
    ├── Shared
    │   ├── DTOs
    │   ├── Enums
    │   ├── Models
    ├── Test
    │   ├── TestResults
```

## [Azure](https://azure.microsoft.com/en-us)

<img src="imgs/db_activity_log.png" width="auto" />

## [ArgoCD](https://azure.microsoft.com/en-us)

<img src="imgs/argocd.png" width="auto" />

## [Docker](https://www.docker.com/get-started/)

<img src="imgs/docker.png"/>

## [GitHub Actions](https://docs.github.com/en/actions)

<img src="imgs/workflow_runs.png" width="auto" />

## [Jenkins](https://www.jenkins.io/doc/)

<img src="imgs/jenkins_classic.png" width="auto" />

## [Kubernetes](https://www.kubernetes.io)

<img src="imgs/k8s.png" width="auto" />

## [Traefik](https://doc.traefik.io/traefik/)

<img src="imgs/traefik_dashboard.png"/>

