# Update and Insert

<!--
await db
  .insert(pageIntegrations)
  .values({ ...item, pageId })
  .onConflictDoUpdate({
    target: [pageIntegrations.pageId, pageIntegrations.type],
    set: { ...item },
  })
-->

TODO
