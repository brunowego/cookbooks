# Matomo Diagnostics

## State

```sh
#
./console plugin:activate Diagnostics

#
./console plugin:deactivate Diagnostics
```

## Command

```sh
#
./console diagnostics:run

#
./console diagnostics:analyze-archive-table $(gdate +%Y_%m)
```

##

| Name | Description |
| --- | --- |
| Group | |
| Archives | |
| Invalidated | |
| Temporary | |
| Error | |
| Segment | |
| Numeric Rows | |
| Blob Rows | |
| Blob Data | |

## Issues

### File integrity

```log
File integrity: WARNING File integrity check failed and reported some errors. You should fix this issue and then refresh this page until it shows no error.
```

TODO

### Last Successful Archiving Completion

```log
Last Successful Archiving Completion: WARNING For optimal performance and a speedy Matomo, it is highly recommended to set up a crontab to automatically archive your reports, and to disable browser triggering in the Matomo settings. Learn more.
```

```sh
#
./console config:set 'General.enable_browser_archiving_triggering=0'

#
gtime -v ./console core:archive \
  --url http://127.0.0.1:8080 \
  --force-idsites 1
```

### Forced SSL Connection

```log
Forced SSL Connection: WARNING We recommend using Matomo over secure SSL connections only. To prevent insecure access over http, add force_ssl = 1 to the General section in your Matomo config/config.ini.php file.
```

```sh
./console config:set 'General.force_ssl=1'
```

### Geolocation

```log
Geolocation: WARNING Geolocation works, but you are not using one of the recommended providers. If you have to import log files or do something else that requires setting IP addresses, use the PHP GeoIP 2 implementation and install maxminddb extension.
```

Install and configure [GeoIP](/matomo-geoip.md).
