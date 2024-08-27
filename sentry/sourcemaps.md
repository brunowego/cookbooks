# Sentry Source Maps (JavaScript)

## Learn

- [Sourcemaps | Debugging Next.js Applications with Sentry](https://youtube.com/watch?v=-jluayy_jJo)
- [Upload your source maps using Sentry CLI.](https://docs.sentry.io/platforms/javascript/sourcemaps/uploading/cli/)
- [Krystof Woldrich – Debugging with Sentry's Debug IDs | App.js Conf 2024](https://youtube.com/watch?v=O2018vdtahI)

<!-- ## TBD

```sh
npx @sentry/wizard@latest -i sourcemaps
``` -->

<!-- ##

1. Projects -> Select Project
2. Project Settings -> Processing -> Source Maps -->

<!--
sentry-cli sourcemaps inject ./

sentry-cli sourcemaps upload \
  --org <org-name> \
  --project <project-name> \
  ./
-->

<!--
//# debugId=<debug_id>
-->

## Issues

### TBD

```log
No Source File With Matching Debug ID
You already uploaded artifacts with Debug IDs but none of the uploaded source files had a Debug ID matching this stack frame's Debug ID: be18eb0c-3dd0-4589-ba08-391792b04b79

Make sure to inject Debug IDs into all of your source files and to upload all of them to Sentry.
```

<!--
https://blog.sentry.io/how-to-fix-source-map-upload-errors/
-->

TODO
