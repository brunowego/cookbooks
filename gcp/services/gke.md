# Google Kubernetes Engine (GKE)

<!--
gcp.credentials.file=${GCP_CREDENTIALS_PATH:/etc/credentials.json}

https://github.com/search?o=desc&q=path%3Amodules%2Fgke+filename%3Amain.tf&s=indexed&type=Code
-->

**Keywords:** Kubernetes Orchestration, Control Plane

## Links

- [Main Website](https://cloud.google.com/kubernetes-engine)

## Console

- [Kubernetes clusters](https://console.cloud.google.com/kubernetes/list/overview)

## Docs

- [Get started using the Google Cloud CLI (GKE)](https://cloud.google.com/binary-authorization/docs/getting-started-cli)

## CLI

### Dependencies

- [gke-gcloud-auth-plugin](/gcp/gke-gcloud-auth-plugin.md)

### Commands

```sh
gcloud container --help
```

### Usage

```sh
#
gcloud config get-value project

#
gcloud container clusters list

#
gcloud container clusters get-credentials '<cluster-name>' \
  --zone '<location>'

#
gcloud container images list
```

### Tips

#### Check Permissions

```sh
kubectl auth can-i --list
```

### Issues

#### TBD

```log
Message:      Pod was terminated in response to imminent node shutdown.
```

<!--
https://medium.com/mediamarktsaturn-tech-blog/dealing-with-terminated-pods-in-gke-clusters-using-non-standard-provisioning-models-29950281a75
-->

TODO

#### TBD

```log
Error: google-github-actions/get-gke-credentials failed with: required "container.clusters.get" permission(s) for "projects/<name>/locations/<location>/clusters/<name>".
```

TODO

#### Missing Authentication

```log
Unable to connect to the server: x509: certificate signed by unknown authority
```

```sh
#
gcloud container clusters list

#
gcloud container clusters get-credentials '<cluster-name>' \
  --zone '<location>'
```

#### TBD

```log
error: failed to create clusterrolebinding: clusterrolebindings.rbac.authorization.k8s.io is forbidden: User "brunowego@gmail.com" cannot create resource "clusterrolebindings" in API group "rbac.authorization.k8s.io" at the cluster scope: requires one of ["container.clusterRoleBindings.create"] permission(s).
```

TODO

```sh
#
gcloud config list

#
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user=$(gcloud config get-value core/account)
```
