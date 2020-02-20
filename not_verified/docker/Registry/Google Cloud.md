# Google Cloud

##

```sh
gcloud compute instances delete docker-cache --project=public --zone=europe-west1-c --quiet
```

```sh
gcloud compute instances create-with-container \
  --project public \
  --zone 'europe-west1-c' \
  --boot-disk-device-name 'docker-cache' \
  --boot-disk-size 250GB \
  --boot-disk-type pd-ssd \
  --container-env 'REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io' \
  --container-image 'registry:2.7.1' \
  --container-restart-policy always \
  --image-family cos-stable \
  --image-project cos-cloud \
  --machine-type n1-standard-4 \
  --network buildkite \
  --network-tier PREMIUM \
  docker-cache
```
