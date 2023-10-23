# Serverless Stack Toolkit (SST)

<!--
https://github.com/Swolebrain/billing

https://github.com/search?q=path%3Asst.config+content%3ASSTConfig+content%3Astacks%2Fauth&type=code&p=3
-->

**Keywords:** Infrastrucutre as Code, Build on AWS CDK, Serverless Framework

## Links

- [Code Repository](https://github.com/sst/sst)
- [Main Website](https://sst.dev)
- [Console](https://console.sst.dev)
- [Docs](https://docs.sst.dev)
  - [Config](https://docs.sst.dev/config)
- [Examples](https://sst.dev/examples/index.html)
  - [Code Repository](https://github.com/sst/sst/tree/master/examples)
- [Guide](https://sst.dev/guide.html)
- [Demo](https://demo.sst.dev)

<!--
https://old.console.sst.dev
-->

## Articles

- [How to save money with hexagonal architecture and SST](https://awstip.com/how-to-save-money-with-hexagonal-architecture-and-sst-eec065caaac)

## Videos

- [I finally moved my SaaS off Amplify to SST, but it wasn't that easy](https://youtube.com/watch?v=Szr5SNFBT3g)

<!--
https://www.youtube.com/watch?v=E547i_xPqrU&t=5s
https://www.youtube.com/watch?v=xgUpI_EnAQs
-->

<!--
https://dev.to/slsbytheodo/deploy-a-nextjs-app-for-free-on-aws-with-sst-3g28
https://dev.to/jolo/thoughts-about-sst-4j2e
-->

## CLI

### Links

- [Docs](https://docs.sst.dev/packages/sst)

### Commands

```sh
npx sst -h
```

### Configuration

```sh
#
sst telemetry disable
```

### Usage

```sh
#
sst dev

#
sst console

#
sst diff --stage dev

#
sst remove
```

<!--
sst build

sst deploy --stage dev
-->

### Tips

#### Secrets

```sh
npx sst secrets set <ENV> <value>
npx sst secrets remove <ENV>
```

#### Update

```sh
#
sst update 2.27.0

pnpm install
```
