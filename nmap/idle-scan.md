# Idle Scan

**Keywords:** Penetration Test

## Attack

```sh
#
nmap \
  -sI <idle-machine-ip> \
  -Pn \
  -n \
  -p80 \
  --packet-trace \
  -v <target-machine-ip>
```

<!--
-p80,21 -r
-->
