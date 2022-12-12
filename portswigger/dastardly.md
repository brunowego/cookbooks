# PortSwigger Dastardly

<!--
https://github.com/PortSwigger/dastardly-github-action
https://github.com/cds-snc/scan-files/blob/main/.github/workflows/dast_vulnerability_scan.yml
-->

**Keywords:** DAST

## Links

- [Main Website](https://portswigger.net/burp/dastardly)
- [Docs](https://portswigger.net/burp/documentation/dastardly)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h dastardly \
  -e DASTARDLY_TARGET_URL='https://ginandjuice.shop' \
  -e DASTARDLY_OUTPUT_FILE='/dastardly/dastardly-report.xml' \
  --name dastardly \
  --network workbench \
  public.ecr.aws/portswigger/dastardly:latest
```
