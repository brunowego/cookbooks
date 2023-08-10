# GitOps

<!--
https://app.pluralsight.com/library/courses/automating-kubernetes-deployments-gitops-workflow/table-of-contents
-->

<!--
Pull-Based vs. Push-Based
-->

GitOps is an operating model pattern for cloud native applications & Kubernetes storing application & declarative infrastructure code in Git as the source of truth used for automated continuous delivery.

## Links

- [Awesome GitOps](https://github.com/weaveworks/awesome-gitops)
- [GitOps Working Group](https://github.com/gitops-working-group/gitops-working-group)
- [Guide To GitOps](https://weave.works/technologies/gitops/)

## Tools

- [Argo CD](/argo/argo-cd/README.md)
- [Codefresh](/codefresh.md)
- [Flux CD](/fluxcd.md)
- [Jenkins X](/jenkins/jenkins-x.md)
- [Weave GitOps Core](https://github.com/weaveworks/weave-gitops)

## Books

- [GitOps and Kubernetes: Continuous Deployment with Argo CD, Jenkins X, and Flux](https://manning.com/books/gitops-and-kubernetes)
- [GitOps: Cloud-native Continuous Deployment](https://leanpub.com/gitops)

## What Is

- GitOps is a fast-growing "operating model" pattern for cloud native applications commonly associated with Kubernetes.
- GitOps allows you to push code not containers.
- Git is the source of truth describing the desired state of your entire system.
- If it can be described it can be automated with GitOps such as: apps, configs, dashboards, monitoring, etc..

## Benefits of GitOps

- App & Ops in Git: Enhanced Developer Experience
- Continuous Syncing: More Reliability=
- Simplified Operations: Increase Productivity
- Full Audit Trail: Compliance & Stability
- Everything as a Code: Rollback, Consistency & Standardization
- Continuous Security: Access shift, Security as Code, Credentials & State segregation

## The Difference Between GitOps and DevOps

- DevOps often takes a "Push" approach while GitOps takes a "Pull" approach to pipeline workflow.
- In DevOps the app & deployment pipelines are often separate with IaC scripts used for a static one-time deployment of the environment.
- GitOps replaces scripts of kubectl, Terraform, & Helm with an operator that handles operations tasks such as create, change, delete in a Kuberentes cluster based on what's described in Git.

## What's The Difference Between GitOps and Iac

- Declarative IaC actually plays a key role in GitOps as GitOps syncs the sate of the live environment with the IaC in the Git repo.
- Declarative IaC is a part of GitOps - Terraform, K8s Manifests etc., Helm.
- GitOps applies the Git ecosystem & tooling to an infrastructure.

## Principles of GitOps

- Git is the source of truth of entire system.
- Desired system state is versioned in Git.
- System state described declaratively.
- Git as the single place of operations (create, change, delete)
- Autonomous Agents enforce desired state and alert on drift.
- Automated delivery of approved system state changes.

## GitOps Practices

- Pull over Push
- At least 2 repositories per App. One for app source code & second for configs (manifests)
- Ensure your test
- Have a plan for secrets management
- Have a plan for backups

## GitOps Tooling

- Kubernetes: Defacto for cloud native apps. Handles 3 major infra pillars: compute, network, & storage.
- Docker: A runtime for containers. More & more cloud native apps containerized.
- Container/Helm Registry: Used to host & manage container images/Helm Charts.
- Git: Version control, i.e. Bitbucket, Azure DevOps, GitHub, GitLab - GitOps source of truth.
- Helm: Package manager for Kubernetes used for creating, installing, & managing packages.
- Flagger: Delivery operator that automates the promotion of canary deployments with GitOps.
- Prometheus: Monitoring & alerting system - the heart of GitOps alerting.
- Terraform: Provision any infrastructure. Often used to deploy Kubernetes clusters in GitOps.
- Flux: GitOps operator for Kubernetes.
- Argo CD: GitOps operator for kubernetes with a visual approach.
- Jenkins X: CI/CD platform for Kubernetes used to manage GitOps pipelines.
- Git-Secret: Encrypts secrets & stores them in Git. Automatically encrypts & decrypts in GitOps workflow.
- Git-backup/Kube Backup: Kubernetes & Git repos are critical, back them up. Automate backup of git repos & cluster config.

## GitOps Operators

- Flux: Kubernetes GitOps Operator/
- Argo CD: Kubernetes GitOps Operator with visual approach/
- Kubestack: Terraform GitOps Framework for building Kubernetes on any platform.
- Jenkins X: Kubernetes pipeline automation with build-in GitOps.

## GitOps Architecture Components

- Source Control System (i.e. ADO, GitHub, GitLab, Bitbucket)
- Git Repository
- Container/Helm Registry
- Operator (i.e. Flux, Argo CD, Kubectl apply, Terraform (K8s provider), etc.)
- Runtime Environment (i.e. 1 K8s cluster multiple namespaces or 1 K8s cluster per environment (i.e. dev, stage, prod))
- Namespaces (namespace per environment (i.e. dev, stage, prod), per app, per service, per engineer, per build, etc.)

## GitOps Operator Types

- Cloud Infrastructure (Infrastructure Automation)
  - Terraform for setup/upgrade/modify
  - Cloud IaaS, IAM, Kubernetes Cluster, Namespaces, Ingress Controller, Service Mesh, Monitoring
  - e.g Kubestack, Jenkins X
- Cluster (Application Automation)
  - K8s manifests/Helm charts
  - For the application: Deployment, Pods, Services, ConfigMaps, Namespaces, etc.
  - e.g. Argo CD, Flux CD
