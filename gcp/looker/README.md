# Looker

**Keywords:** Business Intelligence (BI), Enterprise-level BI

<!--
Data Viewers
Data Explorers
LookML Developers
Administrators
-->

<!--
Folders

Business Technology
EPD
Physical Security
Sales Engineering
Customer Success
Executive
Profissional Services
Sales Operations
DCL
HR
Sales
-->

<!--
https://github.com/glewio/glew-looker-shopify-sf/tree/master
https://github.com/monte-carlo-data/data_observability_insights_analytics_block
https://github.com/llooker/datablocks-weathersource
https://github.com/nacoDriven/looker-demo
-->

<!--
https://marketplace.looker.com/marketplace/detail/extension-api-explorer
-->

## Links

- [Org. Repository](https://github.com/looker-open-source)
- [Console](https://console.cloud.google.com/projectselector2/looker/instances)
- [Main Website](https://looker.com) <!-- https://cloud.google.com/looker -->
- [Looker UI Components](https://components.looker.com)
  - [Figma](https://figma.com/community/file/991772952747115810)
- [Marketplace](https://marketplace.looker.com)
- [Demo](https://demo.looker.com)

## Terms

- Dimensions
- Measures
- Filters
- Visualizations
- Dashboards

<!-- ##

offset
pivot_offset
offset_lit
mean
-->

## Learn

- [BI and Analytics with Looker](https://app.pluralsight.com/paths/skill/bi-and-analytics-with-looker)

<!--
https://www.youtube.com/@chrishage/videos

https://www.youtube.com/watch?v=b5GPGH0OdJU
https://www.youtube.com/watch?v=_NXisSxkzNY
-->

## CLI

### Commands

```sh
gcloud looker --help
```

### Usage

<!--
https://console.cloud.google.com/apis/credentials
-->

```sh
#
gcloud services enable looker.googleapis.com

#
gcloud looker instances list --region us-east1

#
gcloud projects list
gcloud alpha quotas info list --service looker.googleapis.com --project <project-id>

#
# gcloud alpha services quota list --project <project-id>

#
gcloud looker instances create \
  looker-analytics-stg \
  --region us-east1 \
  --edition core-standard \
  --oauth-client-id <client-id> \
  --oauth-client-secret <client-secret>

# Valid choices are core-embed-annual, core-enterprise-annual, core-standard, core-standard-annual, core-trial
```

<!--
StandardInstancesPerProjectPerRegion
EmbedSubscriptionInstancesPerProjectPerRegion
StandardSubscriptionInstancesPerProjectPerRegion
-->

## Tips

<!-- ### Visual Studio Code

```sh
#
code --install-extension sgoley.lookml-syntax-highlighter

#
jq '."recommendations" += ["sgoley.lookml-syntax-highlighter"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
``` -->

### Create Looker (Google Cloud core) instance

1. Create Looker (Google Cloud core) instance
   - Instance Name: `looker-analytics-stg` <!-- looker-analytics-prod -->
   - OAuth Application Credentials
     - Client ID: ``
     - Client Secret: ``

## Issues

### TBD

```log
You are not authorized to view this page.
403
```

TODO

### TBD

```log
You do not have quota available for this option
```

<!--
https://cloud.google.com/contact
-->

<!--
https://console.cloud.google.com/flows/enableapi?apiid=looker.googleapis.com
https://console.cloud.google.com/flows/enableapi?apiid=servicenetworking.googleapis.com
https://console.cloud.google.com/flows/enableapi?apiid=compute.googleapis.com

https://console.cloud.google.com/apis/credentials
-->

<!--
https://cloud.google.com/looker/docs/looker-core-instance-create
-->

1. [Quotas & System Limits for project](https://console.cloud.google.com/iam-admin/quotas)
2. Looker (Google Cloud core) API

<!--
https://cloud.google.com/looker/docs/modeler/looker-core-edition-types
https://console.cloud.google.com/apis/api/looker.googleapis.com/quotas

Dimensions (e.g. location): region:us-east1
InstancesPerProjectPerRegion
-->

### TBD

```log
ERROR: (gcloud.looker.instances.create) RESOURCE_EXHAUSTED: AllocateQuota failed for project number 282444594905 when allocating quota for looker.googleapis.com/trial_instances
```

<!--
gcloud compute project-info describe --project crafty-biplane-442818-t9

Name : Looker trial instances per project

https://console.cloud.google.com/iam-admin/quotas/qirs
https://cloud.google.com/resources/looker-free-trial?hl=en
-->

TODO
