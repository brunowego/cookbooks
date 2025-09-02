# Artificial Intelligence Code

## Tips

### Replication

```sh
#
git diff develop...HEAD --patch --unified=0 > ./changes.patch

#
git log --reverse --pretty=format:"%h %s%n%b---" develop...HEAD > ./commits.txt
```

### Prompt

```md
You are assisting in migrating a table from **shadcn/ui Table** to **TanStack Table**.

## Context

I’ve already migrated two tables successfully, and there’s a clear pattern. To guide the migration, analyze these two files:

- @changes.patch → Git diff of previous successful migrations.
- @commits.txt → Commit messages explaining the reasoning behind the changes.

## Your Goal

- Study the pattern from `changes.patch` and `commits.txt`.
- Apply the same migration to the file: @page.client.tsx
- Keep styling and UI behavior consistent with the existing code.
- Follow the same structure, hooks, and column definitions used in the diff.

## Output Format

- Return the **full updated code** for `page.client.tsx`.
- If the pattern uses extracted files (e.g., `columns.ts` or `DataTable.tsx`), include them too.
- Keep the output clean and directly usable.
```
