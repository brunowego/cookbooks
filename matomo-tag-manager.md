# Matomo Tag Manager

## References

- [Easily track Events within Matomo Analytics](https://matomo.org/blog/2019/06/easily-track-events-within-matomo-analytics-thanks-to-matomo-tag-manager/)

## Activate

```sh
#
./console plugin:activate TagManager

#
docker exec -i matomo ./console plugin:activate TagManager
```

##

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matomo TMS</title>

    <script type="text/javascript">
        var _mtm = window._mtm = window._mtm || [];
        _mtm.push({'mtm.startTime': (new Date().getTime()), 'event': 'mtm.Start'});

        var d = document,
            g = d.createElement('script'),
            s = d.getElementsByTagName('script')[0];

        g.type = 'text/javascript';
        g.async = true;
        g.src = 'http://127.0.0.1:8080/js/container_[hash].js';
        s.parentNode.insertBefore(g, s);
    </script>
</head>
<body>
    <h1>Matomo TMS</h1>
</body>
</html>
```

<!-- ```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matomo</title>
</head>
<body>
    <h1>Matomo</h1>

    <script type="text/javascript">
        var _paq = window._paq = window._paq || [];
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);

        (function() {
            var u = "//127.0.0.1:8080/";
            _paq.push(['setTrackerUrl', u + 'matomo.php']);
            _paq.push(['setSiteId', '1']);

            var d = document,
            g = d.createElement('script'),
            s = d.getElementsByTagName('script')[0];

            g.type = 'text/javascript';
            g.async = true;
            g.src = u+'matomo.js';
            s.parentNode.insertBefore(g, s);
        })();
    </script>
</body>
</html>
``` -->
