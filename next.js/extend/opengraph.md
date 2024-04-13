# Extend with Open Graph

<!--
https://github.com/openstatusHQ/openstatus/blob/main/apps/web/src/app/status-page/%5Bdomain%5D/layout.tsx
-->

<!--
1,200 x 630 pixels
-->

<!--
https://github.com/leerob/leerob.io/blob/main/app/og/route.tsx

https://github.com/web3bio/web3bio/blob/main/app/api/og/route.tsx
https://github.com/openstatusHQ/openstatus/blob/main/apps/web/src/app/api/og/route.tsx
https://github.com/dubinc/dub/blob/main/apps/web/app/api/og/analytics/route.tsx
-->

<!-- ## Installation

```sh
# Using Bun
bun add @vercel/og
``` -->

## Issues

### Missing Display Flex

```log
[cause]: Error: Expected <div> to have explicit "display: flex" or "display: none" if it has more than one child node.
```

Missing `display: 'flex'` or `display: 'none'` in the (parent or child) `div` tag.
