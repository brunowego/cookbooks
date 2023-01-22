# Google Cloud Platform (GCP)

<!--
gcloud auth application-default login
-->

<!--
Google Compute Engine (GCE)
-->

<!--
https://app.pluralsight.com/paths/certificate/cloud-architecture-with-google-cloud
https://app.pluralsight.com/library/courses/serverless-data-processing-dataflow-foundations/table-of-contents
https://linkedin.com/learning/google-cloud-platform-gcp-essential-training-for-developers/kicking-off-your-gcp-development
-->

## Console

- [Dashboard](https://console.cloud.google.com/home/dashboard)
- [OAuth Consent Screen](https://console.cloud.google.com/apis/credentials/consent/edit)
- [Credentials](https://console.cloud.google.com/apis/credentials)

## Links

- [Google Cloud Pricing Calculator](https://cloud.google.com/products/calculator)
- [Google Cloud Status Dashboard](https://status.cloud.google.com)

## Tools

- [Google Cloud Profile Switcher (GCPS)](/gcps.md)

## CLI

### Links

- [Main Website](https://cloud.google.com/cli)

### Installation

#### Homebrew

```sh
brew install --cask google-cloud-sdk
```

#### APT

```sh
echo 'deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main' | \
  sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg

sudo apt update
sudo apt -y install google-cloud-cli
```

<!-- #### YUM

TODO -->

#### Chocolatey

```sh
choco install -y gcloudsdk
```

### Commands

```sh
gcloud --help
```

### Usage

```sh
#
gcloud info

#
gcloud config configurations create <org-name>

#
gcloud auth list

#
gcloud config set account <account>

#
gcloud auth login

#
gcloud config set disable_usage_reporting false

#
gcloud config configurations list

#
ls ~/.config/gcloud

#
gcloud config get-value core/account

#
gcloud projects list

#
gcloud projects create <unique-name>

#
gcloud config set project <project-id>

#
gcloud compute regions list

#
gcloud config get-value compute/region
gcloud config get-value compute/zone

#
gcloud config set compute/region us-west1
gcloud config set compute/zone us-west1-a
```

<!--
#
gcloud config set run/region <region>

#
gcloud auth configure-docker

#
gcloud beta container clusters create 'model-mgmt' \
  --cluster-version '1.12.8-gke.10' \
  --zone 'us-central1-a' \
  --machine-type 'n1-standard-2' \
  --image-type 'COS' \
  --disk-size '10' \
  --network 'default'

#
gcloud beta container clusters list

#
gcloud beta container clusters delete 'model-mgmt' --zone 'us-central1-a'
-->

### Tips

#### Rename

```sh
#
gcloud config configurations list

#
gcloud config configurations rename <current-name> --new-name <new-name>

#
gcloud config configurations activate <new-name>
```

### Issues

#### Missing Application Default Login

```sh
│ Error: Invalid provider configuration
│
│ Provider "registry.terraform.io/hashicorp/google" requires explicit configuration. Add a provider block to the root module and configure the provider's required arguments as described in the provider
│ documentation.
```

```sh
gcloud auth application-default login
```

#### TBD

```log
AccessDeniedException: 403 The billing account for the owning project is disabled in state absent
```

TODO
