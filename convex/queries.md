# Convex Queries

<!-- ## Query

```ts
export default query(async (ctx: any) => {
  return await ctx.db.query('block_attributes')
    .withIndex("by_value_organization_id", (q) =>
      q.eq("organization_id", "<org-id>").eq("value", "ar")
    )
    .collect();
})
``` -->

<!-- ## Patch

```ts
export const getBlockAttributes = query(async (ctx: any) => {
  return await ctx.db.query('block_attributes')
    .withIndex("by_value_organization_id", (q) =>
      q.eq("organization_id", "<org-id>").eq("value", "ar")
    )
    .collect();
});

export const updateBlockAttributes = mutation(async (ctx: any) => {
  let lastId = null;

  while (true) {
    const blockAttributes = await getBlockAttributes(ctx)
      .withCursor(lastId)
      .limit(100)
      .collect();

    if (blockAttributes.length === 0) {
      break;
    }

    for (const blockAttribute of blockAttributes) {
      await ctx.db.patch(blockAttribute._id, {
        value: blockAttribute.value.toUpperCase(),
      });
    }

    lastId = blockAttributes[blockAttributes.length - 1]._id;
  }
});
``` -->

## Issues

### TBD

```log
Uncaught Error: Too many documents read in a single function execution (limit: 16384). Consider using smaller limits in your queries, paginating your queries, or using indexed queries with a selective index range expressions.
```

TODO
