# koder

<!--
https://github.com/maslick/kameroon
https://github.com/vuckookv3/vuleqr
https://github.com/guidopetri/cleanslate
https://github.com/marmooo/simple-QR
https://github.com/HeinKoZin/qrcode-scaner
-->

**Keywords:** QR Code Scanner, Barcode Scanner

<!--
https://github.com/zxing-js/library
https://github.com/mchehab/zbar
-->

## Links

- [Code Repository](https://github.com/maslick/koder)
- [Demo](https://koder-prod.web.app)

## Library

### Installation

```sh
# Using pnpm
pnpm add @maslick/koder
```

### Configuration

```sh
cp ./node_modules/@maslick/koder/browser.js ./public/wasm/koder.js
cp ./node_modules/@maslick/koder/zbar.js ./public/wasm/zbar.js
cp ./node_modules/@maslick/koder/zbar.wasm ./public/wasm/zbar.wasm
```

**Refer:** `./public/wasmWorker.js`

```js
importScripts('wasm/zbar.js')
importScripts('wasm/koder.js')
;(async () => {
  // Initialize Koder
  const koder = await new Koder().initialize({ wasmDirectory: './wasm' })

  // Listen for messages from JS main thread containing raw image data
  self.addEventListener('message', (event) => {
    if ('width' in event.data && 'height' in event.data) {
      this.width = event.data.width
      this.height = event.data.height
    }

    const { data } = event.data

    if (!data) return

    const t0 = new Date().getTime()
    const scanResult = koder.decode(data, this.width, this.height)
    const t1 = new Date().getTime()

    if (scanResult) {
      postMessage({
        data: scanResult,
        ms: t1 - t0,
      })
    }
  })
})()
```
