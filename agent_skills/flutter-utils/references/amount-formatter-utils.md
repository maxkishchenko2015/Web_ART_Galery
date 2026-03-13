# Amount Formatter Utils

Keep monetary formatting in one service-style utility to avoid inconsistent UI strings.

## Pattern goals

- Stable decimal rendering for API and UI.
- Optional omission of unnecessary fractions.
- Explicit currency-code rendering when ambiguity matters.
- One place for locale/currency formatting decisions.

## Recommended API slices

- `decimalString(amount, omittingUnnecessaryFractions: ...)`
- `apiDecimalString(amount)`
- `decimalStringWithCurrencyCode(amount)`
- `currencyString(amount)`
- `currencyStringFrom(...)`

## Implementation notes

- Keep API payload precision assertions separate from UI formatting.
- For promotional/free-space UI, symbol rendering may be acceptable.
- For money transfer and comparison UI, prefer explicit currency code.
- Document locale behavior if implementation is POSIX-fixed or partially localized.
