# Postman Interceptor

## Extension

- [Google Chrome](https://chromewebstore.google.com/detail/postman-interceptor/aicmkgpgakddgnaphhhpliifpcfhicfo?hl=en)

## Learn

- [Postman 10.x Tutorial (Latest) - Syncing Cookies using Interceptor for Authentication](https://youtube.com/watch?v=rNDSEZF5IpA)

## Configuration

1. Open Postman -> Request (GET)
2. Cookies (Footer)
3. Sync Cookies -> Interceptor
4. Domains -> `localhost` (without port number) -> Add Domain
5. Send

### Browser

#### Sync Cookies

1. Open Browser -> Postman Interceptor
2. Sync Cookies -> Domains -> `http://localhost:3000` -> Enter
3. Sync Cookies

#### Capture Requests

1. Open Browser -> Postman Interceptor
2. Capture Requests
3. URL filter -> `http://localhost:3000` -> Enter
4. Start Capture
