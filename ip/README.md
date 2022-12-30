# Internet Protocol (IP)

<!--
http://test-ipv6.com/
-->

<!--
Private: 10.0.10.x
Public: 172.x.x.x
-->

## Tips

### IP Info

```sh
#
curl ipinfo.io/<ip>
```

<!--
curl -H 'Host: ipinfo.io' <ip>/json
-->

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
