# Kubestack

<!--
kbst
-->

Kubestack's GitOps Framework is Terraform & Kustomize based designed for fully automated GitOps infrastructure.

## Links

- [Main Website](https://kubestack.com)

## Guides

- [GitOps Process](https://kubestack.com/framework/documentation/gitops-process)

## Workflow

- Uses Terraform workspaces to differentiate between infrastructure (ops) & application (apps) environments.
- All changes tart with a commit in a Git repo follow a GitOps process with changes following the same four steps every time.
- Git branches and tags determine the environment and pipeline steps.
- Automation validades changes against the ops environment before tit applies them to the apps environment.
