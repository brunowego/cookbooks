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
