# WordPress Advanced Custom Fields

## References

- [Order posts by custom fields](https://www.advancedcustomfields.com/resources/orde-posts-by-custom-fields/)
- [Query posts by custom fields](https://www.advancedcustomfields.com/resources/query-posts-custom-fields/)

## Develop

- [ACF Field Type Template](https://github.com/AdvancedCustomFields/acf-field-type-template)

## Installation

```sh
wp plugin install advanced-custom-fields --activate

# Custom Fields
wp plugin install acf-field-date-time-picker --activate
wp plugin install acf-field-video --activate
wp plugin install acf-field-address --activate
```

## Docs

### Add Field

1. Custom Fields
2. Field Groups -> Add New
   - Title: Posts
   - Add Field
     - Field Label: Order
     - Field Name: order
     - Field Type: Number
   - Publish
