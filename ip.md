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
