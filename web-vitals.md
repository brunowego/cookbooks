# Web Vitals

<!--
Lazy loading
-->

## Links

- [Code Repository](https://github.com/GoogleChrome/web-vitals)
- [Main Website](https://web.dev/vitals/)
- [Web Vitals patterns](https://web.dev/patterns/web-vitals-patterns/)
- [Monitor Core Web Vitals](https://sentry.io/for/web-vitals/)
- [Chrome User Experience Report](https://developers.google.com/web/tools/chrome-user-experience-report)

## Tools

- [Chrome DevTools](https://developer.chrome.com/docs/devtools/)
- [Chrome UX Report](https://developers.google.com/web/tools/chrome-user-experience-report)
- [Chrome Web Vitals Extension](https://chrome.google.com/webstore/detail/web-vitals/ahfhijdlegdabablpippeagghigmibma?hl=en)
- [Google Lighthouse](https://github.com/GoogleChrome/lighthouse)
- [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/)
- [Google Search Console](https://search.google.com/search-console/about)
- [Measure page quality](https://web.dev/measure/) **★**
- [WebPageTest](https://webpagetest.org/)

## Metrics

- Cumulative Layout Shift (CLS)
- First Contentful Paint (FCP) / Largest Contentful Paint (LCP)
- First Input Delay (FID)
- Time To First Byte (TTFB)
- Total Blocking Time (TBT)

## Extensions

- [Web Vitals for Chrome](https://chrome.google.com/webstore/detail/web-vitals/ahfhijdlegdabablpippeagghigmibma?hl=en)

## Issues

### Missing Link Title

```log
Link text (and alternate text for images, when used as links) that is discernible, unique, and focusable improves the navigation experience for screen reader users.
```

```html
<a title="Title" href="/"></a>
```
