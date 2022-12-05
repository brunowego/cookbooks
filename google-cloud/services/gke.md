# Google Kubernetes Engine (GKE)

<!--
gcp.credentials.file=${GCP_CREDENTIALS_PATH:/etc/credentials.json}
-->

**Keywords:** Kubernetes Orchestration

## Docs

- [Get started using the Google Cloud CLI (GKE)](https://cloud.google.com/binary-authorization/docs/getting-started-cli)

## CLI

### Dependencies

- [gke-gcloud-auth-plugin](/google-cloud/gke-gcloud-auth-plugin.md)

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

#### Missing Right kubectl Version

```log
W1205 10:14:27.717264   31189 gcp.go:119] WARNING: the gcp auth plugin is deprecated in v1.22+, unavailable in v1.26+; use gcloud instead.
To learn more, consult https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
```

```sh
# If using kbenv
brew link --overwrite kbenv
```

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
