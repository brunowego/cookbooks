# Internet Protocol (IP)

<!--
http://test-ipv6.com/
-->

<!--
Private: 10.0.10.x
Public: 172.x.x.x
-->

## Tips

### Local IP

```sh
# Darwin
ipconfig getifaddr en0
```

### IP Info

```sh
curl https://ipinfo.io/<ip>
```

<!--
curl -H 'Host: ipinfo.io' <ip>/json
-->

### IP Geolocation and Currency Converter APIs

```sh
curl -s http://geoplugin.net/json.gp | jq .
```

### My IP Address

```sh
curl -s https://httpbin.org/ip | jq -r '.origin'
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
