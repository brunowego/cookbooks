# Database Migration

## Mistakes

- NEVER use `ALTER TABLE` to add a column with a `NOT NULL` constraint to an existing table.
- ALWAYS use `ALTER TABLE` to add a column with a `NULL` constraint to an existing table.

<!--
ALTER TABLE "stores" ADD COLUMN "ein" varchar NOT NULL;--> statement-breakpoint

ALTER TABLE "stores" ADD CONSTRAINT "stores_ein_unique" UNIQUE("ein");

ALTER TABLE "stores" DROP CONSTRAINT "stores_ein_unique";--> statement-breakpoint
ALTER TABLE "stores" DROP COLUMN IF EXISTS "ein";
-->
