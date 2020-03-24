# Matomo ExtraTools

## Installation

```sh
cd /path/to/matomo
```

```sh
curl -L https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz | \
  tar -xzC ./misc --strip-components 1 GeoLite2-City_20191105/GeoLite2-City.mmdb
```

## Docs

### Invalidate Reports

1. General settings
2. System
3. Geolocation -> Location Provider
   - Choose: DBIP / GeoIP 2 (Php)
   - Save
