# Google Cloud SDK

## Installation

### Homebrew

```sh
brew cask install google-cloud-sdk
```

## Commands

```sh
gcloud --help
```

### Create

```sh
gcloud auth login
```

```sh
gcloud config get-value core/account
```

```sh
gcloud config set project [project-id]
```

```sh
gcloud beta container clusters create 'model-mgmt' \
  --cluster-version '1.12.8-gke.10' \
  --zone 'us-central1-a' \
  --machine-type 'n1-standard-2' \
  --image-type 'COS' \
  --disk-size '10' \
  --network 'default'
```

```sh
gcloud beta container clusters list
```

```sh
gcloud container clusters get-credentials 'model-mgmt' --zone 'us-central1-a'
```

```sh
gcloud beta container clusters delete 'model-mgmt' --zone 'us-central1-a'
```
