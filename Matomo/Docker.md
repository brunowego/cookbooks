# Docker

## Volume

```sh
docker volume create matomo-mysql-data
docker volume create matomo-data
docker volume create matomo-logs
docker volume create matomo-nginx-conf
```

## Running

```sh
docker run -d \
  -h mysql.matomo.local \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=matomo \
  -e MYSQL_PASSWORD=matomo \
  -e MYSQL_DATABASE=matomo \
  -v matomo-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name matomo-mysql \
  --restart always \
  mysql:5.7
```

> `mysql:8.0 --default-authentication-plugin=mysql_native_password`

```sh
docker run -d \
  -h app.matomo.local \
  -v matomo-data:/var/www/html \
  -v matomo-logs:/var/www/html/logs \
  -p 9000:9000 \
  --name matomo-app \
  --restart always \
  --link matomo-mysql \
  matomo:3.9.1-fpm-alpine
```

```sh
docker run -d \
  -h nginx.matomo.local \
  -v matomo-nginx-conf:/etc/nginx/conf.d \
  -v matomo-data:/var/www/html \
  -v /etc/localtime:/etc/localtime:ro \
  -p 8080:80 \
  --name matomo-nginx \
  --restart always \
  --link matomo-app \
  nginx:1.15.8-alpine
```

```sh
docker exec -i matomo-nginx /bin/sh << 'EOSHELL'
cat << 'EOF' > /etc/nginx/conf.d/default.conf
upstream matomo {
    server matomo-app:9000;
}

server {
    listen 80 default_server;
    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass matomo;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location = /health-check {
        access_log off;
        default_type application/json;
        return 200 '{"status": "UP"}';
    }
}
EOF
EOSHELL
```

```sh
docker restart matomo-nginx
```

```sh
curl http://"$(docker-machine ip)":8080/health-check
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

##

```sh
docker exec -iu www-data:1000 matomo-app /bin/sh << 'EOSHELL'
cat << 'EOF' > /var/www/html/config/config.ini.php
; <?php exit; ?> DO NOT REMOVE THIS LINE
; file automatically generated or modified by Matomo; you can manually override the default values in global.ini.php by redefining them in this file.
[database]
host = "mysql"
username = "matomo"
password = "matomo"
dbname = "matomo"
tables_prefix = "matomo_"

[General]
salt = "2661dd72411b044b26b39965fe1753bf"

[Plugins]
Plugins[] = "CorePluginsAdmin"
Plugins[] = "CoreAdminHome"
Plugins[] = "CoreHome"
Plugins[] = "WebsiteMeasurable"
Plugins[] = "IntranetMeasurable"
Plugins[] = "Diagnostics"
Plugins[] = "CoreVisualizations"
Plugins[] = "Proxy"
Plugins[] = "API"
Plugins[] = "Widgetize"
Plugins[] = "Transitions"
Plugins[] = "LanguagesManager"
Plugins[] = "Actions"
Plugins[] = "Dashboard"
Plugins[] = "MultiSites"
Plugins[] = "Referrers"
Plugins[] = "UserLanguage"
Plugins[] = "DevicesDetection"
Plugins[] = "Goals"
Plugins[] = "Ecommerce"
Plugins[] = "SEO"
Plugins[] = "Events"
Plugins[] = "UserCountry"
Plugins[] = "GeoIp2"
Plugins[] = "VisitsSummary"
Plugins[] = "VisitFrequency"
Plugins[] = "VisitTime"
Plugins[] = "VisitorInterest"
Plugins[] = "ExampleAPI"
Plugins[] = "RssWidget"
Plugins[] = "Feedback"
Plugins[] = "Monolog"
Plugins[] = "Login"
Plugins[] = "TwoFactorAuth"
Plugins[] = "UsersManager"
Plugins[] = "SitesManager"
Plugins[] = "Installation"
Plugins[] = "CoreUpdater"
Plugins[] = "CoreConsole"
Plugins[] = "ScheduledReports"
Plugins[] = "UserCountryMap"
Plugins[] = "Live"
Plugins[] = "CustomVariables"
Plugins[] = "PrivacyManager"
Plugins[] = "ImageGraph"
Plugins[] = "Annotations"
Plugins[] = "Overlay"
Plugins[] = "SegmentEditor"
Plugins[] = "Insights"
Plugins[] = "Morpheus"
Plugins[] = "Contents"
Plugins[] = "BulkTracking"
Plugins[] = "Resolution"
Plugins[] = "DevicePlugins"
Plugins[] = "Heartbeat"
Plugins[] = "Intl"
Plugins[] = "ProfessionalServices"
Plugins[] = "UserId"
Plugins[] = "CustomPiwikJs"

[PluginsInstalled]
PluginsInstalled[] = "Diagnostics"
PluginsInstalled[] = "Login"
PluginsInstalled[] = "CoreAdminHome"
PluginsInstalled[] = "UsersManager"
PluginsInstalled[] = "SitesManager"
PluginsInstalled[] = "Installation"
PluginsInstalled[] = "Monolog"
PluginsInstalled[] = "Intl"
PluginsInstalled[] = "CorePluginsAdmin"
PluginsInstalled[] = "CoreHome"
PluginsInstalled[] = "WebsiteMeasurable"
PluginsInstalled[] = "IntranetMeasurable"
PluginsInstalled[] = "CoreVisualizations"
PluginsInstalled[] = "Proxy"
PluginsInstalled[] = "API"
PluginsInstalled[] = "ExamplePlugin"
PluginsInstalled[] = "Widgetize"
PluginsInstalled[] = "Transitions"
PluginsInstalled[] = "LanguagesManager"
PluginsInstalled[] = "Actions"
PluginsInstalled[] = "Dashboard"
PluginsInstalled[] = "MultiSites"
PluginsInstalled[] = "Referrers"
PluginsInstalled[] = "UserLanguage"
PluginsInstalled[] = "DevicesDetection"
PluginsInstalled[] = "Goals"
PluginsInstalled[] = "Ecommerce"
PluginsInstalled[] = "SEO"
PluginsInstalled[] = "Events"
PluginsInstalled[] = "UserCountry"
PluginsInstalled[] = "GeoIp2"
PluginsInstalled[] = "VisitsSummary"
PluginsInstalled[] = "VisitFrequency"
PluginsInstalled[] = "VisitTime"
PluginsInstalled[] = "VisitorInterest"
PluginsInstalled[] = "ExampleAPI"
PluginsInstalled[] = "RssWidget"
PluginsInstalled[] = "Feedback"
PluginsInstalled[] = "TwoFactorAuth"
PluginsInstalled[] = "CoreUpdater"
PluginsInstalled[] = "CoreConsole"
PluginsInstalled[] = "ScheduledReports"
PluginsInstalled[] = "UserCountryMap"
PluginsInstalled[] = "Live"
PluginsInstalled[] = "CustomVariables"
PluginsInstalled[] = "PrivacyManager"
PluginsInstalled[] = "ImageGraph"
PluginsInstalled[] = "Annotations"
PluginsInstalled[] = "MobileMessaging"
PluginsInstalled[] = "Overlay"
PluginsInstalled[] = "SegmentEditor"
PluginsInstalled[] = "Insights"
PluginsInstalled[] = "Morpheus"
PluginsInstalled[] = "Contents"
PluginsInstalled[] = "BulkTracking"
PluginsInstalled[] = "Resolution"
PluginsInstalled[] = "DevicePlugins"
PluginsInstalled[] = "Heartbeat"
PluginsInstalled[] = "Marketplace"
PluginsInstalled[] = "ProfessionalServices"
PluginsInstalled[] = "UserId"
PluginsInstalled[] = "CustomPiwikJs"

EOF
EOSHELL
```

## Update

```sh
docker exec -i matomo-app /usr/local/bin/php /var/www/html/console core:update --yes
```

## Visitor Generator

```sh
docker run -it --rm \
  -v matomo-data:/var/www/html \
  alpine/git:1.0.7 clone https://github.com/matomo-org/plugin-VisitorGenerator.git /var/www/html/plugins/VisitorGenerator
```

```sh
docker exec -i matomo-app /usr/local/bin/php /var/www/html/console plugin:activate VisitorGenerator
```

```sh
docker exec -i matomo-app /usr/local/bin/php /var/www/html/console visitorgenerator:generate-visits \
  --idsite 1 \
  -vvv
```

## Archive

```sh
docker exec -i matomo-app /usr/local/bin/php /var/www/html/console config:set --section='General' --key='enable_browser_archiving_triggering' --value='0'
```

```sh
docker exec -i matomo-app /bin/su -s '/bin/sh' -c '/usr/local/bin/php /var/www/html/console core:archive' www-data
```

## Misc

```sh
docker exec -i matomo-app /usr/local/bin/php /var/www/html/console config:set --section='General' --key='enable_trusted_host_check' --value='0'
docker exec -i matomo-app /usr/local/bin/php /var/www/html/console config:set --section='General' --key='enable_sql_optimize_queries' --value='0'
docker exec -i matomo-app /usr/local/bin/php /var/www/html/console config:set --section='General' --key='enable_marketplace' --value='0'
docker exec -i matomo-app /usr/local/bin/php /var/www/html/console config:set --section='General' --key='enable_internet_features' --value='0'
docker exec -i matomo-app /usr/local/bin/php /var/www/html/console config:set --section='General' --key='enable_auto_update' --value='0'
docker exec -i matomo-app /usr/local/bin/php /var/www/html/console config:set --section='General' --key='enable_update_communication' --value='0'
```

## Remove

```sh
docker rm -f matomo-mysql matomo-app matomo-nginx-conf
docker volume rm matomo-mysql-data matomo-data matomo-logs matomo-nginx-conf
```
