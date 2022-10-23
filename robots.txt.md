# Robots Exclusion Standard (robots.txt)

## Tips

### HTML Tag

```html
<!-- Follow, index -->
<meta
  name="robots"
  content="follow, index, max-snippet:-1, max-video-preview:-1, max-image-preview:large"
/>

<!-- No index -->
<meta name="robots" content="noindex" />
```

<!--
X-Robots-Tag
-->

### Disallow All

```sh
cat << EOF > ./robots.txt
User-agent: *
Disallow: /
EOF
```

### WordPress

**_example.com_**

```txt
User-agent: *
Disallow: /wp-admin/
Allow: /wp-admin/admin-ajax.php

Sitemap: https://example.com/sitemap.xml
```

### Application

**_app.example.com_**

```txt
# http://robotstxt.org
User-agent: *
Allow: /$
Allow: /login
Allow: /register
Allow: /password
Disallow: /

Sitemap: https://example.com/sitemap.xml
```
