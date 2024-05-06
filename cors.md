# Cross-Origin Resource Sharing (CORS)

## Links

- [test-cors.org](https://test-cors.org)

## References

- [Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)

## Tips

### Check CORS Headers

```sh
export URL='http://acme.localtest.me:3000'

curl -I \
  -X OPTIONS \
  -H "Origin: ${URL}" \
  -H 'Access-Control-Request-Method: GET' \
  "${URL}" 2>&1 | grep -i 'Access-Control-Allow-Origin'
```

## Issues

### CORS Preflight

```log
CORS Preflight Did Not Succeed
```

Reason: [CORS request did not succeed](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS/Errors/CORSDidNotSucceed)

## Tips

### Browser Extension

- Google Chrome / [Allow CORS: Access-Control-Allow-Origin](https://chrome.google.com/webstore/detail/allow-cors-access-control/lhobafahddgcelffkeicbaginigeejlf?hl=en)
