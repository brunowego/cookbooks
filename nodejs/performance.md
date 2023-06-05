# Node.js Performance

## Links

- Docs
  - [Using Heap Snapshot](https://nodejs.org/en/docs/guides/diagnostics/memory/using-heap-snapshot)

## Terms

- Bottleneck

## Tools

### Managed

- [AppSignal](https://docs.appsignal.com/nodejs)
- [Raygun](https://raygun.com/languages/node)
- [Sematext](https://sematext.com/docs/integration/node.js)

### Open Source

- [Clinic.js](/clinicjs/README.md) 🌟
- [express-status-monitor](/express-status-monitor.md)
- [Node Application Metrics (AppMetrics)](/appmetrics.md) (unmaintained)
- [PM2](/pm2.md) (using `pm2 monit`)
- [Prometheus](/prometheus/README.md) (with [Grafana](/grafana/README.md))

## Tips

### V8 Profiler

```sh
#
node --prof ./app.js

node --prof-process <filename>.log > ./processed.txt
```

### Increase Heap Memory

```sh
#
node --help --v8-options

# 1GB
node --max-old-space-size=1024 ./app.js

NODE_OPTIONS='--max-old-space-size=1024' node ./app.js
```

<!--
Out Of Memory (OOMKilled)
-->
