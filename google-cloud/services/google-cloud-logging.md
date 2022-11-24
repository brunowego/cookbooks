# Google Cloud Logging

## Console

- [Logs Explorer](https://console.cloud.google.com/projectselector2/logs/query?supportedpurview=folder,organizationId,project)

## CLI

### Commands

```sh
gcloud logging --help
```

### Usage

```sh
#
gcloud logging logs list
gcloud logging logs list --filter 'compute'
```

<!--
gcloud logging read 'resource.type=gce_instance' --limit 5

gcloud logging read 'resource.type=gce_instance AND labels.instance_name="gcelab2"' --limit 5

gcloud logging metrics create high_severity_count \
  --description="Number of high severity log entries" \
  --log-filter="severity > WARNING"

gcloud logging sinks create my-bq-sink \
  bigquery.googleapis.com/projects/my-project/datasets/\
  my_dataset --log-filter='resource.type="gce_instance"'
-->
