# flux-open-id-connect-authentication-backend

Open id connect authentication backend

## Set up

*You need to fill placeholders (Wrapped in `%`), create secret files and adjust to your needs (Applies everywhere)*

### Docker

#### Compose

```yaml
services:
    flux-open-id-connect-authentication-backend:
        environment:
            - FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_AUTHENTICATION_PASSWORD_FILE=/run/secrets/flux_open_id_connect_authentication_backend_password
            - FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_CLIENT_ID_FILE=/run/secrets/flux_open_id_connect_authentication_backend_provider_client_id
            - FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_CLIENT_SECRET_FILE=/run/secrets/flux_open_id_connect_authentication_backend_provider_client_secret
            - FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_URL=%provider-host%
        image: fluxfw/flux-open-id-connect-authentication-backend:%version%
        secrets:
            - flux_open_id_connect_authentication_backend_password
            - flux_open_id_connect_authentication_backend_provider_client_id
            - flux_open_id_connect_authentication_backend_provider_client_secret
secrets:
    flux_open_id_connect_authentication_backend_password:
        file: ./data/secrets/flux_open_id_connect_authentication_backend_password
    flux_open_id_connect_authentication_backend_provider_client_id:
        file: ./data/secrets/flux_open_id_connect_authentication_backend_provider_client_id
    flux_open_id_connect_authentication_backend_provider_client_secret:
        file: ./data/secrets/flux_open_id_connect_authentication_backend_provider_client_secret
```

### Config

| Config | Default value | Environment variable | Cli parameter | Config JSON file |
| ------ | ------------- | -------------------- | ------------- | ---------------- |
| Config JSON file<br>(Root entry need to be an object) | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_CONFIG_FILE` | `--config-file ...` | *-* |
| **Authentication password** | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_AUTHENTICATION_PASSWORD`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_AUTHENTICATION_PASSWORD_FILE` | `--authentication-password ...`<br>`--authentication-password-file ...` | `"authentication-password": "..."`<br>`"authentication-password-file": "..."` |
| Authentication user | `flux-open-id-connect-authentication-backend` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_AUTHENTICATION_USER`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_AUTHENTICATION_USER_FILE` | `--authentication-user ...`<br>`--authentication-user-file ...` | `"authentication-user": "..."`<br>`"authentication-user-file": "..."` |
| Cookie domain | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_DOMAIN`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_DOMAIN_FILE` | `--cookie-domain ...`<br>`--cookie-domain-file ...` | `"cookie-domain": "..."`<br>`"cookie-domain-file": "..."` |
| Cookie http only | `true` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_HTTP_ONLY`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_HTTP_ONLY_FILE` | `--cookie-http-only ...`<br>`--cookie-http-only-file ...` | `"cookie-http-only": ...`<br>`"cookie-http-only-file": "..."` |
| Cookie name | `authentication` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_NAME`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_NAME_FILE` | `--cookie-name ...`<br>`--cookie-name-file ...` | `"cookie-name": "..."`<br>`"cookie-name-file": "..."` |
| Cookie path | `/api` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_PATH`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_PATH_FILE` | `--cookie-path ...`<br>`--cookie-path-file ...` | `"cookie-path": "..."`<br>`"cookie-path-file": "..."` |
| Cookie priority | `Medium` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_PRIORITY`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_PRIORITY_FILE` | `--cookie-priority ...`<br>`--cookie-priority-file ...` | `"cookie-priority": "..."`<br>`"cookie-priority-file": "..."` |
| Cookie same site | `Lax` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_SAME_SITE`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_SAME_SITE_FILE` | `--cookie-same-site ...`<br>`--cookie-same-site-file ...` | `"cookie-same-site": "..."`<br>`"cookie-same-site-file": "..."` |
| Cookie secure | `true` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_SECURE`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_COOKIE_SECURE_FILE` | `--cookie-secure ...`<br>`--cookie-secure-file ...` | `"cookie-secure": ...`<br>`"cookie-secure-file": "..."` |
| Frontend base route | `/api/authentication` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_FRONTEND_BASE_ROUTE`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_FRONTEND_BASE_ROUTE_FILE` | `--frontend-base-route ...`<br>`--frontend-base-route-file ...` | `"frontend-base-route": "..."`<br>`"frontend-base-route-file": "..."` |
| **Provider client id** | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_CLIENT_ID`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_CLIENT_ID_FILE` | `--provider-client-id ...`<br>`--provider-client-id-file ...` | `"provider-client-id": "..."`<br>`"provider-client-id-file": "..."` |
| **Provider client secret** | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_CLIENT_SECRET`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_CLIENT_SECRET_FILE` | `--provider-client-secret ...`<br>`--provider-client-secret-file ...` | `"provider-client-secret": "..."`<br>`"provider-client-secret-file": "..."` |
| Provider HTTPS certificate<br>(For trust self signed) | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_HTTPS_CERTIFICATE`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_HTTPS_CERTIFICATE_FILE` | `--provider-https-certificate ...`<br>`--provider-https-certificate-file ...` | `"provider-https-certificate": "..."`<br>`"provider-https-certificate-file": "..."` |
| Provider redirect uri | `http[s]://%host%/api/authentication/callback` (Based on request and frontend base route) | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_REDIRECT_URI`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_REDIRECT_URI_FILE` | `--provider-redirect-uri ...`<br>`--provider-redirect-uri-file ...` | `"provider-redirect-uri": "..."`<br>`"provider-redirect-uri-file": "..."` |
| Provider scope | `openid` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_SCOPE`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_SCOPE_FILE` | `--provider-scope ...`<br>`--provider-scope-file ...` | `"provider-scope": "..."`<br>`"provider-scope-file": "..."` |
| **Provider url** | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_URL`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_PROVIDER_URL_FILE` | `--provider-url ...`<br>`--provider-url-file ...` | `"provider-url": "..."`<br>`"provider-url-file": "..."` |
| Redirect after login url | `/Libs/flux-authentication-frontend-api/src/Adapter/Authentication/AuthenticationSuccess.html` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_REDIRECT_AFTER_LOGIN_URL`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_REDIRECT_AFTER_LOGIN_URL_FILE` | `--redirect-after-login-url ...`<br>`--redirect-after-login-url-file ...` | `"redirect-after-login-url": "..."`<br>`"redirect-after-login-url-file": "..."` |
| Redirect after logout url | `/` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_REDIRECT_AFTER_LOGOUT_URL`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_REDIRECT_AFTER_LOGOUT_URL_FILE` | `--redirect-after-logout-url ...`<br>`--redirect-after-logout-url-file ...` | `"redirect-after-logout-url": "..."`<br>`"redirect-after-logout-url-file": "..."` |
| Server disable http if https is used | `true` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_DISABLE_HTTP_IF_HTTPS`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_DISABLE_HTTP_IF_HTTPS_FILE` | `--server-disable-http-if-https ...`<br>`--server-disable-http-if-https-file ...` | `"server-disable-http-if-https": ...`<br>`"server-disable-http-if-https-file": "..."` |
| Server HTTPS certificate<br>(HTTPS is only used if this config is set) | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_HTTPS_CERTIFICATE`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_HTTPS_CERTIFICATE_FILE` | `--server-https-certificate ...`<br>`--server-https-certificate-file ...` | `"server-https-certificate": "..."`<br>`"server-https-certificate-file": "..."` |
| Server HTTPS dh param | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_HTTPS_DHPARAM`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_HTTPS_DHPARAM_FILE` | `--server-https-dhparam ...`<br>`--server-https-dhparam-file ...` | `"server-https-dhparam": "..."`<br>`"server-https-dhparam-file": "..."` |
| Server HTTPS private key<br>(HTTPS is only used if this config is set) | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_HTTPS_KEY`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_HTTPS_KEY_FILE` | `--server-https-key ...`<br>`--server-https-key-file ...` | `"server-https-key": "..."`<br>`"server-https-key-file": "..."` |
| Server listen HTTP port<br>(Set to `0` for explicit disable HTTP) | `80` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_LISTEN_HTTP_PORT`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_LISTEN_HTTP_PORT_FILE` | `--server-listen-http-port ...`<br>`--server-listen-http-port-file ...` | `"server-listen-http-port": ...`<br>`"server-listen-http-port-file": "..."` |
| Server listen HTTPS port<br>(Set to `0` for explicit disable HTTPS) | `443` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_LISTEN_HTTPS_PORT`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_LISTEN_HTTPS_PORT_FILE` | `--server-listen-https-port ...`<br>`--server-listen-https-port-file ...` | `"server-listen-https-port": ...`<br>`"server-listen-https-port-file": "..."` |
| Server listen interface | *-* | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_LISTEN_INTERFACE`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_LISTEN_INTERFACE_FILE` | `--server-listen-interface ...`<br>`--server-listen-interface-file ...` | `"server-listen-interface": "..."`<br>`"server-listen-interface-file": "..."` |
| Enable server redirects HTTP to HTTPS | `false` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_REDIRECT_HTTP_TO_HTTPS`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_REDIRECT_HTTP_TO_HTTPS_FILE` | `--server-redirect-http-to-https ...`<br>`--server-redirect-http-to-https-file ...` | `"server-redirect-http-to-https": ...`<br>`"server-redirect-http-to-https-file": "..."` |
| Server redirect HTTP to HTTPS port | `443` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_REDIRECT_HTTP_TO_HTTPS_PORT`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_REDIRECT_HTTP_TO_HTTPS_PORT_FILE` | `--server-redirect-http-to-https-port ...`<br>`--server-redirect-http-to-https-port-file ...` | `"server-redirect-http-to-https-port": ...`<br>`"server-redirect-http-to-https-port-file": "..."` |
| HTTP status code server redirects HTTP to HTTPS | `302` | `FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_REDIRECT_HTTP_TO_HTTPS_STATUS_CODE`<br>`FLUX_OPEN_ID_CONNECT_AUTHENTICATION_BACKEND_SERVER_REDIRECT_HTTP_TO_HTTPS_STATUS_CODE_FILE` | `--server-redirect-http-to-https-status-code ...`<br>`--server-redirect-http-to-https-status-code-file ...` | `"server-redirect-http-to-https-status-code": ...`<br>`"server-redirect-http-to-https-status-code-file": "..."` |

Required config are **bold**
