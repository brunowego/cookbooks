# Node.js Performance

## Tips

### Increase Heap Memory

```sh
#
node --help --v8-options

# 8GB
node --max-old-space-size=8192 ./app.js

NODE_OPTIONS='--max-old-space-size=8192' node ./app.js
```

<!--
Out Of Memory (OOMKilled)
-->
