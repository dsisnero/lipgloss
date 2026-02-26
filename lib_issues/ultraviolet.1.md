# Ultraviolet missing public parsing helpers needed by Lipgloss wrap path

## Summary

`Lipgloss::WrapWriter` needs to decode ANSI SGR (`CSI ... m`) and OSC-8
hyperlinks while preserving style state. In `ultraviolet`, the expected helper
APIs were missing/inaccessible for this use case, which forced local fallback
parsing in `src/wrap.cr`.

## Missing API surface

1. Public SGR parser from CSI params into `Ultraviolet::Style`
   * Needed Go-style exported API: `ReadStyle` / `ReadStyleFromParams`
2. Stable public OSC-8 parser from raw bytes into `Ultraviolet::Link`
   * Needed Go-style exported API: `ReadLink` / `ReadLinkFromData`
   * Current Crystal API shape is not aligned to upstream Go exported naming.

## Impact

1. `src/wrap.cr` previously failed to compile when calling missing methods.
2. We had to duplicate style parsing logic (`apply_sgr`) in Lipgloss, which
   increases drift risk vs Ultraviolet behavior.
3. Hyperlink/style decode behavior is now split across libraries instead of
   centralized in Ultraviolet.

## Reproduction

1. In Lipgloss, call from wrap path:
   * `Ultraviolet.ReadStyle(...)` or `Ultraviolet.ReadStyleFromParams(...)`
   * `Ultraviolet.ReadLink(...)` or `Ultraviolet.ReadLinkFromData(...)`
2. Build fails due to missing methods.

## Expected

Ultraviolet should expose public, supported helpers for:

1. Applying parsed CSI params to a style state object.
2. Applying OSC-8 payload bytes to a link state object.

## Suggested fix

1. Add and document exported Go-parity APIs in Ultraviolet:
   * `ReadStyle`, `ReadStyleFromParams`
   * `ReadLink`, `ReadLinkFromData`
2. Keep wrappers stable across versions to avoid downstream breakage.
3. Add shard-level tests that exercise downstream-style incremental ANSI
   parsing.
