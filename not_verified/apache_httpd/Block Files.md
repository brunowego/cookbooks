# Block Files

## Deny Access

### XML Files

```ini
<Files ~ "\.xml$">
  Order allow,deny
  Deny from all
  Satisfy all
</Files>
```

### Sitemap

```ini
<FilesMatch "(?!sitemap)\.xml$">
  Order allow,deny
  Deny from all
  Satisfy all
</Files>
```

## Allow Access

### XML Files

```ini
<Files ~ "\.xml$">
  Order allow,deny
  Allow from all
  Satisfy all
</Files>
```
