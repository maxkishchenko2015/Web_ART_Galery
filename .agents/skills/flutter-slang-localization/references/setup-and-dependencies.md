# Setup and Dependencies

## Versions

```yaml
dependencies:
  slang: ^4.13.0
  slang_flutter: ^4.13.0

dev_dependencies:
  build_runner: ^2.6.0
  slang_build_runner: ^4.13.0
```

## Directory example

```text
lib/
  i18n/
    en.i18n.json
    es.i18n.json
```

## First generation

```bash
dart run slang
```

If CI requires build_runner flow:

```bash
dart run build_runner build -d
```
