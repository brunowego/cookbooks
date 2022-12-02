# Jenkins X

<!--
https://app.pluralsight.com/library/courses/jenkins-x-cloud-native-ci-cd/table-of-contents
https://github.com/SeldonIO/sig-mlops-jenkins-classic/tree/master/model_implementations/news_classifier
-->

**Keywords:** Continuous Integration

## Links

- [Main Website](https://jenkins-x.io/)

## Guides

- [Overview](https://jenkins-x.io/v3/about/overview/)

## Workflow

- Full automated CI/CD pipelines to provision & provide GitOps for both infrastructure and application.
- Has an infrastructure repository that holds Terraform code & a cluster repository that holds Kubernetes manifest code.
- Runs microservices on K8s cluster for Jenkins X arch including: jx-git-operator, jx, lighthouse, kuberhealthy, NGINX ingress, secret-infra, & tekton-pipelines

## Life Cycle

1. Jenkins X "cloud" Terraform module (aks-jx) to provision Kubernetes cluster
2. Install Jenkins X, setup repos, and new project
3. Dev commits & pushes change to the Git repository
4. JX is notified & runs the pipeline in a Docker image
5. The pipeline builds, tests, & pushes a Helm chart to Chart registry & imagem to container registry
6. The pipeline creates a Pull Request with changes needed to add the project to the staging environment
7. Jenkins X automatically merges the pull request to master & starts the staging pipeline
8. Staging pipeline runs Helm, deploying environment: pulling Helm charts & images, uses Kubectl apply creating resources such as: namespace, deployment, pod/s, service/s, ingress
