# Lighthouse

## Links

- [Code Repository](https://github.com/GoogleChrome/lighthouse)
- [Main Website](https://developers.google.com/web/tools/lighthouse/)

## Tools

- [Measure page quality](https://web.dev/measure/)
- [WebPageTest](https://webpagetest.org/)
- [Lighthouse Metrics](https://lighthouse-metrics.com)

## CLI

### Installation

```sh
# Using NPM
npm install lighthouse -g

# Using Yarn v1.x
yarn global add lighthouse
```

### Configuration

```sh
# Git ignore
cat << EOF >> ~/.gitignore_global
/latest-run
/*.report.html
EOF
```

### Commands

```sh
# Using NPX
npx lighthouse --help

# Using Local
lighthouse --help
```

### Usage

```sh
#
lighthouse http://xyz.tld \
  -G

#
lighthouse http://xyz.tld \
  -A

#
lighthouse http://xyz.tld \
  -GA

#
lighthouse http://localhost:3000/docs/ \
  --chrome-flags='--ignore-certificate-errors' \
  --view
```

## Library

### Links

- [Code Repository](https://github.com/GoogleChrome/lighthouse-ci)

### Installation

```sh
# Using NPM
npm install @lhci/cli --save-dev

# Using Yarn
yarn add @lhci/cli --dev
```

### Configuration

**Refer:** `./.lighthouserc.cjs`

```cjs
const lighthouseRC = {
  ci: {
    collect: {
      startServerCommand: 'yarn start',
      url: ['http://localhost:3000'],
      numberOfRuns: 1,
    },
    assert: {
      preset: 'lighthouse:recommended',
      assertions: {
        'csp-xss': ['warn'],
        'image-size-responsive': ['warn'],
        'unsized-images': ['warn'],
        'unused-javascript': ['warn'],
      },
    },
    upload: {
      target: 'temporary-public-storage',
    },
  },
}

module.exports = lighthouseRC
```

**Refer:** `./package.json`

```json
{
  "scripts": {
    // "pretest:lighthouse": "yarn build",
    "test:lighthouse": "lhci autorun"
  }
}
```

```sh
#
echo '/.lighthouseci' >> ./.gitignore

# Using NPM
npm run test:lighthouse

# Using Yarn
yarn test:lighthouse
```

<!--
lhci collect
lhci upload
lhci assert
lhci autorun
lhci healthcheck
lhci open
lhci wizard
lhci server
-->
