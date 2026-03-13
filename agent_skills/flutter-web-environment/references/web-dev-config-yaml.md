# web_dev_config.yaml

Support for `web_dev_config.yaml` is available in Flutter 3.38+.

## Basic server config

```yaml
server:
  host: "0.0.0.0"
  port: 8080
  https:
    cert-path: "/path/to/cert.pem"
    cert-key-path: "/path/to/key.pem"
```

## Custom headers

```yaml
server:
  headers:
    - name: "Cache-Control"
      value: "no-cache, no-store, must-revalidate"
```

## Proxy examples

```yaml
server:
  proxy:
    - target: "http://localhost:5000/"
      prefix: "/users/"
    - target: "http://localhost:3000/"
      prefix: "/data/"
      replace: "/report/"
    - target: "http://localhost:4000/"
      regex: "^/api/(v\\d+)/(.*)"
      replace: "/$2?apiVersion=$1"
```

## Precedence

1. CLI args (`--web-hostname`, `--web-port`)
2. `web_dev_config.yaml`
3. Flutter defaults
