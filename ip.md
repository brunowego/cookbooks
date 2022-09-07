# Internet Protocol (IP)

<!--
http://test-ipv6.com/
-->

## Tips

### My IP Address

```sh
curl -s httpbin.org/ip | \
  jq -r '.origin'
```

### Node.js REPL

**Dependencies:** Node.js >= 18

```js
.editor

const ipReq = await fetch('https://api.ipify.org/?format=json')
(await ipReq.json())?.ip

// hit: Ctrl + D

.exit
```
