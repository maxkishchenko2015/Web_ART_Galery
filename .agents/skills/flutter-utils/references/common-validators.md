# Common Validators

Use a centralized validator class for localized, reusable field validation.

## Structure pattern

- Inject localization object (`S lang`) via constructor.
- Keep each validator focused by field type (`email`, `zip`, `name`, `state`).
- Compose from smaller checks (`validateControlCharacters`, `validateNoNumbers`, etc.).
- Return localized message keys, not hard-coded strings.

## Useful organization

- Generic checks: empty, min/max length, allowed chars.
- Field-specific checks: email, address, city, zip, state.
- Country-specific variants: US/CA/MX state and zip validation.
- Utility checks: emoji/special symbols/control chars.

## Best practices

- Normalize input before validation (`trim`, remove edge spaces).
- Avoid duplicate regex declarations across methods.
- Keep error priority deterministic (first failing rule wins).
- Prefer pure methods with no side effects.

## Caution

- Very large regexes should be documented and unit tested.
- Country-specific logic should be isolated to avoid branching explosion.
