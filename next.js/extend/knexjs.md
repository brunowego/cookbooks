# Extend with Knex.js

<!--
import Knex from 'knex'

import knexfile from '../knexfile'

const knexConfig = knexfile[process.env.NODE_ENV || 'development']

if (!knexConfig) {
  throw new Error('Knex configuration is undefined')
}

export const knex = Knex(knexConfig)
-->

## Issues

### TBD

```log
Error: Module not found: Can't resolve 'oracledb'
```

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...

  webpack: (config) => {
    config.externals = {
      knex: 'commonjs knex',
    }

    return config
  },
}

export default nextConfig
```
