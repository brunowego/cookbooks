# Puppeteer

## Tools

- [Headless Recorder](https://chrome.google.com/webstore/detail/headless-recorder/djeegiggegleadkkbgopoonhjimgehda)

## Library

### Installation

#### NPM

```sh
npm install puppeteer -g
```

### REPL

```sh
node <(cat << EOF
const puppeteer = require('/usr/local/lib/node_modules/puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('https://google.com');

  const dimensions = await page.evaluate(() => {
    return {
      width: document.documentElement.clientWidth,
      height: document.documentElement.clientHeight,
      deviceScaleFactor: window.devicePixelRatio
    };
  });

  console.log('Dimensions:', dimensions);

  await browser.close();
})();
EOF
)
```

## CLI

### Installation

#### NPM

```sh
npm install puppeteer-cli -g
```

### Commands

```sh
puppeteer -h
```
