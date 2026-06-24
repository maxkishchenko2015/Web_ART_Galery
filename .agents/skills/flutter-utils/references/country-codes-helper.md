# Country Codes Helper

Use a dedicated helper to centralize country code lookup, filtering, and cached refresh.

## Core responsibilities

- Resolve country from phone number prefix.
- Lookup by alpha code, name, or dial code.
- Provide filtered/sorted lists for selectors.
- Keep local cache with remote refresh fallback.

## Pattern highlights

- Build a dial-code index map once for fast exact lookups.
- Keep `countryCodes` source swappable: cache first, fallback to static list.
- Expose helper methods as static when no instance state is needed.
- Log network/cache failures without crashing selection flows.

## Caching flow

1. Read localized country list from key-value storage.
2. If empty, fetch from remote service.
3. Persist successful remote payload.
4. Map payload to normalized string-only maps.
5. Fallback to static bundled list when cache is empty.

## Caution

- NANP countries share dial code `+1`; exact dial-code index alone is not enough.
- Add area-code strategy where precise matching is required.
