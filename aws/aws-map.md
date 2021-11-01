# AWS Migration Acceleration Program (MAP)

## Links

- [Activating Tags](https://s3-us-west-2.amazonaws.com/map-2.0-customer-documentation/html/latest/en/2-activate_tags.html)
- [Included Services and DB Freedom Sources](https://s3-us-west-2.amazonaws.com/map-2.0-customer-documentation/included-services/MAP-Included-Services-List.pdf)

## Tips

### Terraform

```tf
locals {
  map_tags = {
    map-migrated             = var.map_migrated
    map-migrated-app         = var.map_migrated_app
    aws-migration-project-id = var.aws_migration_project_id
  }

  tags = merge(
    local.map_tags,
    var.tags
  )
}
```
