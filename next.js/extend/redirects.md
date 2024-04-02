# Redirects

<!--
https://github.com/sushiswap/sushiswap/blob/master/apps/evm/next.config.mjs
-->

TODO

<!--
redirects: async () => {
  return [
    {
      source: '/d/#_=_',
      destination: '/d',
      permanent: true,
    },
  ]
},
-->

<!--
Failed to fetch RSC payload for https://preview.landing.sely.io/linkedin. Falling back to browser navigation. TypeError: Failed to fetch

Access to fetch at 'https://twitter.com/sellitbr' (redirected from 'http://localhost:3000/x?_rsc=1gzlh') from origin 'http://localhost:3000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.
-->

<!--
async headers() {
  return [
    {
      source: '/:path*',
      headers: [{ key: 'Access-Control-Allow-Origin', value: '*' }],
    },
  ]
},
-->

<!--
async redirects() {
  return [
    {
      source: '/instagram{/}?',
      destination: 'https://instagram.com/sellitbr',
      permanent: true,
    },
    {
      source: '/x{/}?',
      destination: 'https://twitter.com/sellitbr',
      permanent: true,
    },
    {
      source: '/linkedin{/}?',
      destination: 'https://linkedin.com/company/sellitbr',
      permanent: true,
    },
    // {
    //   source: '/medium{/}?',
    //   destination: 'https://blog.sellitbr.com',
    //   permanent: true,
    // },
    {
      source: '/status{/}?',
      destination: 'https://stats.uptimerobot.com/hXZ97lQ9cA',
      permanent: true,
    },
  ]
},
-->
