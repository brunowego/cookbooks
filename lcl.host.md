# lcl.host

**Keywords:** Local Development Environment

## Links

- [Main Website](https://lcl.host)

## CLI

### Installation

```sh
# Using Homebrew
brew tap anchordotdev/tap
brew install anchor
```

### Commands

```sh
anchor lcl -h
```

### Initialize

```sh
#
anchor auth signin

#
anchor lcl audit

#
anchor lcl bootstrap

#
anchor lcl setup

#
anchor lcl trust
```

### Usage

```sh
#
anchor lcl
```

### Tips

#### Next.js

```sh
# Using pnpm
pnpm add anchor-pki

#
echo '/tmp` >> ./.gitignore
```

**Refer:** `./next.config.mjs`

```mjs
import autoCert from 'anchor-pki/auto-cert/integrations/next'

/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
}

const withAutoCert = autoCert({
  enabledEnv: 'development',
})

export default withAutoCert(nextConfig)
```

```sh
#
anchor lcl setup
```

### Issues

#### Wrong API URL

```log
AxiosError: Network Error
```

Try change `NEXT_PUBLIC_BASE_URL` in `.env`.
