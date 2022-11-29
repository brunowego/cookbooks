# Google Cloud Storage

## CLI

### Commands

```sh
gcloud storage --help
```

### Usage

```sh
#
gcloud storage ls

#
gcloud storage ls 'gs://<bucket-path>'

#
gcloud storage buckets create 'gs://<bucket-path>'

#
gcloud storage cp -r ./path/to/local/files 'gs://<bucket-path>'

#
gcloud storage buckets describe 'gs://<bucket-path>' --format json

#
gcloud storage rm -r 'gs://<bucket-path>'
```
