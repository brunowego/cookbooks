# S3cmd

## References

- https://s3tools.org/kb/item14.htm

##

```sh
cat << EOF > ~/.s3cfg
[default]
host_base = https://minio.example.com
host_bucket = https://minio.example.com
use_https = True

access_key = AKIAIOSFODNN7EXAMPLE
secret_key = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
EOF
```
