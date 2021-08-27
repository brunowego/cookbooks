# Robots Exclusion Standard (robots.txt)

## Tips

### HTML Tag

```html
<!-- Follow, index -->
<meta name="robots" content="follow, index, max-snippet:-1, max-video-preview:-1, max-image-preview:large" />

<!-- No index -->
<meta name="robots" content="noindex" />
```

### WordPress

***example.com***

```txt
User-agent: *
Disallow: /wp-admin/
Allow: /wp-admin/admin-ajax.php

Sitemap: https://example.com/sitemap_index.xml
```

### Application

***app.example.com***

```txt
# http://robotstxt.org
User-agent: *
Allow: /$
Allow: /login
Allow: /register
Allow: /password
Disallow: /
```
