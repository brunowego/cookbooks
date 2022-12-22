# ModSecurity

## Enable

```sh
#
kubectl annotate ingress \
  [ingress-name] \
  nginx.ingress.kubernetes.io/enable-modsecurity='true'

#
kubectl annotate ingress \
  [ingress-name] \
  nginx.ingress.kubernetes.io/enable-owasp-core-rules='true'

#
kubectl annotate ingress \
  [ingress-name] \
  nginx.ingress.kubernetes.io/modsecurity-snippet="$(cat << EOF
SecRuleEngine On
SecRule REQUEST_HEADERS:User-Agent \"test-scanner\" \"log,deny,id:107,status:403,msg:\'Test Scanner Identified\'\"
EOF
)"
```

<!-- ```sh
#
kubectl annotate ingress \
  [ingress-name] \
  nginx.ingress.kubernetes.io/configuration-snippet="$(cat << \EOF
if ($geoip_country_code !~ (BR|US|JP) ) {
    return 403;
}
EOF
)"

#
kubectl annotate ingress \
  [ingress-name] \
  nginx.ingress.kubernetes.io/configuration-snippet="$(cat << \EOF
if ($http_user_agent ~ (^.$)){
      return 403;
}
EOF
)"

#
kubectl annotate ingress \
  [ingress-name] \
  nginx.ingress.kubernetes.io/whitelist-source-range='192.168.1.0/24,10.0.0.0/26'
``` -->

## Testing

```sh
#
curl -H 'User-Agent: test-scanner' example.127.0.0.1.nip.io
curl -H 'User-Agent: Mozilla/5.0' example.127.0.0.1.nip.io
```

<!--
#
curl -H 'X-Forwarded-For: 189.6.32.51' example.127.0.0.1.nip.io
-->

<!-- ```yml
SecRequestBodyAccess On
SecAuditEngine RelevantOnly
SecAuditLogType Serial
SecAuditLog /dev/stdout

more_set_headers "X-Frame-Options: DENY" "X-XSS-Protection: 1" "X-Content-Type-Options: nosniff" "Strict-Transport-Security: max-age=63072000" "Content-Security-Policy: default-src 'none'; connect-src 'self'; font-src https://fonts.gstatic.com; img-src 'self' data: blob:; script-src 'self' 'sha256-4qKuKHlhZHVtOHkzV6IoRxvJyftFsU9Bzug8piLac2s=' 'sha256-wFlxiON/IU9ZZ5PD6RqOAhUMQtTTYSO6Fh/5V470Tdo='; style-src 'self' https://fonts.googleapis.com 'unsafe-inline'; frame-ancestors 'none'; base-uri 'none'; form-action 'self'; manifest-src 'self'; prefetch-src 'self'";

SecRule REMOTE_ADDR "!@ipMatch {{ .Values.ingress.modsecurity.whitelist }}" "id:10000,deny"

SecRule REMOTE_ADDR "@ipMatch {{ .Values.ingress.modsecurity.adminWhitelist }}" "id:10005,ctl:ruleEngine=Off"

SecRule REQUEST_URI "@beginsWith /admin" "id:10010,deny"

Include /etc/nginx/owasp-modsecurity-crs/nginx-modsecurity.conf

SecAuditLogParts ABIJDEFHZ
SecAuditLog /var/log/modsec_audit.log
Include /etc/nginx/owasp-modsecurity-crs/nginx-modsecurity.conf
# Include /etc/nginx/modsecurity/modsecurity.conf
``` -->
