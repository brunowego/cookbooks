# Count

TBD

<!--
const [{ total }] = await db
  .select({ total: count(membershipsTable.userId) })
  .from(membershipsTable)
  .where(
    and(
      eq(membershipsTable.organizationId, organization.id),
      eq(membershipsTable.role, 'ADMIN'),
    ),
  )

if (total === 1) {
  return ctx.json({ success: false, error: 'User not found' }, 404)
}
-->
