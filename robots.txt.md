# Robots Exclusion Standard (robots.txt)

```html
<meta name="robots" content="follow, index, max-snippet:-1, max-video-preview:-1, max-image-preview:large"/>
```

## WordPress

***example.com***

```txt
User-agent: *
Disallow: /wp-admin/
Allow: /wp-admin/admin-ajax.php

Sitemap: https://www.example.com/sitemap_index.xml
```

## Application

***app.example.com***

```txt
# http://www.robotstxt.org
User-agent: *
Allow: /$
Allow: /login
Allow: /register
Allow: /password
Disallow: /
```
