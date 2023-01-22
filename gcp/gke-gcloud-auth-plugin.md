# gke-gcloud-auth-plugin

<!--
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
-->

## Dependencies

- Ubuntu
  - [cURL](/curl.md)
  - [GNU Privacy Guard (GnuPG / GPG) or GNU Pretty Good Privacy (PGP)](/gnu/pg.md)

## Installation

### Google Cloud Components

```sh
gcloud components install gke-gcloud-auth-plugin --quiet
```

### APT

```sh
echo 'deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main' | \
  sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg

sudo apt update
sudo apt -y install google-cloud-sdk-gke-gcloud-auth-plugin
```

<!-- ### YUM

```sh
sudo yum install google-cloud-sdk-gke-gcloud-auth-plugin
``` -->

## Commands

```sh
gke-gcloud-auth-plugin --help
```

## Issues

### TBD

```log
error: The gcp auth plugin has been removed.
Please use the "gke-gcloud-auth-plugin" kubectl/client-go credential plugin instead.
See https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke for further details
```

TODO

<!--
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
-->

### Incompatibility with Kubectl Version

```log
W1205 10:14:27.717264   31189 gcp.go:119] WARNING: the gcp auth plugin is deprecated in v1.22+, unavailable in v1.26+; use gcloud instead.
```

```sh
#
kubectl version --short
ls -la "$(where kubectl)"

# If using kbenv
brew unlink kbenv && brew link --overwrite kbenv
# or
kbenv list local
kbenv use <version>
```
