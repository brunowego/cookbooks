# Robots Exclusion Standard (robots.txt)

<!--
https://www.websiteplanet.com/webtools/robots-txt/result/?url=https%3A%2F%2Fhml.us.dellexpertprogram.com%2Frobots.txt
https://en.ryte.com/free-tools/robots-txt/?refresh=1&url=https%3A%2F%2Fhml.us.dellexpertprogram.com&useragent=Googlebot&submit=Evaluate
-->

## Tools

- [SEO Site Checkup / Robots.txt Test](https://seositecheckup.com/tools/robotstxt-test)
- [Ryte / Robots.txt Test Tool](https://en.ryte.com/free-tools/robots-txt)

<!--
https://toolsaday.com/seo/noindex-checker
https://technicalseo.com/tools/robots-txt/
-->

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

**_xyz.tld_**

```txt
User-agent: *
Disallow: /wp-admin/
Allow: /wp-admin/admin-ajax.php

Sitemap: https://xyz.tld/sitemap.xml
```

### Application

**_app.xyz.tld_**

```txt
# http://robotstxt.org
User-agent: *
Allow: /$
Allow: /login
Allow: /register
Allow: /password
Disallow: /

Sitemap: https://xyz.tld/sitemap.xml
```
