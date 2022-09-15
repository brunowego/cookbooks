# Lighthouse

**Dependencies:** [Library](/lighthouse/README.md#library)

## Issues

### Serves images with low resolution

Image natural dimensions should be proportional to the display size and the pixel ratio to maximize image clarity. [Learn more](https://web.dev/serve-responsive-images/?utm_source=lighthouse&utm_medium=devtools).

**Solution:** Define [Image Ratio](/next.js/extend/image.md#image-ratio).

### Image elements do not have explicit width and height

Set an explicit width and height on image elements to reduce layout shifts and improve CLS. [Learn more](https://web.dev/optimize-cls/?utm_source=lighthouse&utm_medium=devtools#images-without-dimensions).

**Solution:** Define [Image Ratio](/next.js/extend/image.md#image-ratio).

### Preload Largest Contentful Paint image

Preload the image used by the LCP element in order to improve your LCP time. [Learn more](https://web.dev/optimize-lcp/?utm_source=lighthouse&utm_medium=devtools#preload-important-resources).

**Solution:**

```tsx
<Image
  // ...
  priority
/>
```

### Minimize main-thread work

Consider reducing the time spent parsing, compiling and executing JS. You may find delivering smaller JS payloads helps with this. [Learn more](https://web.dev/mainthread-work-breakdown/?utm_source=lighthouse&utm_medium=devtools).

**Solution:** TODO

### Reduce JavaScript execution time

Consider reducing the time spent parsing, compiling, and executing JS. You may find delivering smaller JS payloads helps with this. [Learn more](https://web.dev/bootup-time/?utm_source=lighthouse&utm_medium=devtools).

**Solution:** TODO
