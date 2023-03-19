# Base64

**Keywords:** Encoding Scheme

## Tools

- [Convert Your Base64 to Image](https://codebeautify.org/base64-to-image-converter)
- [Base64 to SVG](https://base64.guru/converter/decode/image/svg)
- [Base64 Image Encoder](https://base64-image.de/)

## CLI

### Usage

```sh
#
echo -n '<string>' | base64
```

### Tips

#### Generate Secrets

```sh
#
date +%s | sha256sum | base64 | head -c 32; echo
```
