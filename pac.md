# Proxy auto-config (PAC)

## Tools

- [Pacparser](/pacparser.md)

## References

- [FindProxyForURL](https://findproxyforurl.com/)

##

| OS | Path |
| --- | --- |
| Windows | `file:///C:/proxy.pac` |
| Linux | `file:///home/{user}/.proxy.pac` |
| Darwin | `file:///Users/{user}/.proxy.pac` |

```sh
open "file://$HOME/.proxy.pac"

cat <<END > ~/.proxy.pac
function FindProxyForURL(url, host) {
  if (dnsDomainIs(host, ".testing")) { return "PROXY 192.168.130.11:8080"; }

  return "DIRECT";
}
END

chromium-browser -proxy-pac-url="PAC_URL"

networksetup -setautoproxyurl 'Wi-Fi' "http://localhost:8000/proxy.pac"
```

```sh
mkdir -p ~/.

cat << EOF > ~/.proxy.pac
function FindProxyForURL(url, host) {
  if (shExpMatch(host, "*.local")) {
    return "PROXY 127.0.0.1";
  } else {
    return "DIRECT";
  }
}
EOF

cat << EOF > ~/.proxy.pac
var autoproxy_host = {
  "google.com": 1,
  "twitter.com": 1
};

function FindProxyForURL(url, host) {
  var lastPos;

  do {
    if (autoproxy_host.hasOwnProperty(host)) {
      return 'PROXY 127.0.0.1:51219';
    }

    lastPos = host.indexOf('.') + 1;
    host = host.slice(lastPos);
  } while (lastPos >= 1);

  return 'DIRECT';
}
EOF
```

##

```sh
# Linux
google-chrome --proxy-pac-url='http://localhost:2000/proxy.pac'

# OS X
open -a 'Google Chrome' --args --proxy-pac-url='http://localhost:2000/proxy.pac'
```
