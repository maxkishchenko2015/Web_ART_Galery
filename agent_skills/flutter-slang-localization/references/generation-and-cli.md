# Generation and CLI

## Daily commands

```bash
dart run slang
dart run slang analyze
dart run slang normalize
dart run slang configure
```

## Useful operations

```bash
dart run slang watch
dart run slang stats
dart run slang migrate arb source.arb destination.json
```

## Team workflow

1. Update locale files.
2. Run `dart run slang`.
3. Run `dart run slang analyze`.
4. Commit generated output with locale changes.
