# Artillery

<!--
https://github.com/k8-proxy-glacier/k8-traffic-generator/tree/master/upwork-devs/faisal-adnan/Artillery
https://github.com/subratamazumder/covid19/tree/042e2317a47c25c37476ec283c9ccfee21d48c99/backend-app/data-viewer

https://github.com/ArcadeCity/arcade/blob/main/apps/relay/artillery.yml

https://github.com/ergon/airlock-minikube-example/tree/main/apps/artillery
-->

**Keywords:** Load Testing

## Links

- [Code Repository](https://github.com/artilleryio/artillery)
- [Main Website](https://artillery.io)

## Guides

- [Command Line](https://artillery.io/docs/guides/guides/command-line.html)

## CLI

### Installation

```sh
npm install -g artillery
```

### Usage

```sh
#
artillery run \
  -o ./report.json
  ./artillery-conf.yml

#
export HOSTNAME=''

artillery report \
  -o report-${HOSTNAME}.html \
  ./report.json
```
