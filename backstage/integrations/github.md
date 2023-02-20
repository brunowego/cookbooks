# Backstage GitHub Integration

<!--
https://backstage.io/docs/integrations/github/locations
-->

## Issues

### Missing Github Integration

```log
{"error":{"name":"InputError","message":"NotFoundError: Unable to read url, NotFoundError: https://github.com/<org>/<repo>/tree/main/catalog-info.yaml could not be read as https://raw.githubusercontent.com/<org>/<repo>/main/catalog-info.yaml, 404 Not Found","stack":"InputError: NotFoundError: Unable to read url, NotFoundError: https://github.com/<org>/<repo>/tree/main/catalog-info.yaml could not be read as https://raw.githubusercontent.com/<org>/<repo>/main/catalog-info.yaml, 404 Not Found\n at DefaultLocationService.processEntities (/Volumes/Workspace/Repositories/github.com/<org>/<repo>/node_modules/@backstage/plugin-catalog-backend/dist/index.cjs.js:2188:15)\n at process.processTicksAndRejections (node:internal/process/task_queues:95:5)\n at async DefaultLocationService.dryRunCreateLocation (/Volumes/Workspace/Repositories/github.com/<org>/<repo>/node_modules/@backstage/plugin-catalog-backend/dist/index.cjs.js:2219:22)\n at async /Volumes/Workspace/Repositories/github.com/<org>/<repo>/node_modules/@backstage/plugin-catalog-backend/dist/index.cjs.js:3512:22"},"request":{"method":"POST","url":"/locations?dryRun=true"},"response":{"statusCode":400}}
```

Just install the integration.
