# DigitalOcean Spaces

**Keywords:** Object Storage

## Links

- [Main Website](https://digitalocean.com/products/spaces)
- Console
  - [Projects](https://cloud.digitalocean.com/projects)
  - [Create a Spaces Bucket](https://cloud.digitalocean.com/spaces/new)

## Terms

- Pre-signed URL

<!--
https://<bucket-name>.nyc3.digitaloceanspaces.com
-->

### Issues

#### CORS error

<!--
https://stackoverflow.com/questions/75596632/digitalocean-spaces-presigned-link-upload-failing-cors-despite-cors-configuratio
-->

<!--
https://www.digitalocean.com/community/questions/why-can-i-use-http-localhost-port-with-cors-in-spaces

https://cloud.digitalocean.com/spaces/sellit/settings?i=69f64f

GET, PUT
600 seconds
-->

<!--
Access to XMLHttpRequest at 'https://nyc3.digitaloceanspaces.com/sellit/user/01J092PH0C1PFSHDE3VJNEXBPZ.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=DO00W6EATY9AGUNWMHN7%2F20240613%2Fnyc3%2Fs3%2Faws4_request&X-Amz-Date=20240613T174933Z&X-Amz-Expires=60&X-Amz-Signature=060917337dd609413f99776d686010c7c1fbedd7d604b5e94a254935b8610455&X-Amz-SignedHeaders=host&x-amz-acl=public-read&x-id=PutObject' from origin 'http://app.sellit.localtest.me:3000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: It does not have HTTP ok status.
-->

<!--
403 Forbidden
OPTIONS

Access-Control-Allow-Origin
X-Amz-Acl
Content-Type
-->
