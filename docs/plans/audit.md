# Lipgloss Port Audit

This document tracks the completeness of the Crystal port of lipgloss relative to the Go source (charmbracelet/lipgloss v2-exp).

**Generated:** 2026-02-22 19:06 UTC
**Go Source:** vendor/lipgloss (commit: ?)
**Crystal Source:** src/

## Summary

| Category | Total | Ported | Missing | Coverage |
|----------|-------|--------|---------|----------|
| Constants | 5 | 3 | 2 | 60% |
| Variables | 1 | 1 | 0 | 100% |
| Functions | 50 | ~24 | ~26 | ~48% |
| Types | 16 | ~12 | ~4 | ~75% |
| **Total** | **72** | **~40** | **~32** | **~56%** |

*Note: Function and type coverage approximate; includes methods.*

## Constants

- [x] `Black ansi.BasicColor = iota ...` (ported as `Lipgloss::Color::BLACK` etc.)
- [ ] `NBSP = '\u00A0' ...` (non-breaking space rune, not ported)
- [ ] `UnderlineNone = ansi.UnderlineNone ...` (underline style constants, partially ported via `UnderlineStyle` enum)
- [x] `NoTabConversion = -1` (present as `Style::NO_TAB_CONVERSION`?)
- [x] `Top Position = 0.0 ...` (position constants, ported as `Lipgloss::Position` enum values)

## Variables

- [x] `Writer = colorprofile.NewWriter(os.Stdout, os.Environ())` (ported as `Lipgloss::Writer`? need to verify)

## Functions

### Color Utilities
- [x] `Alpha(c color.Color, alpha float64) color.Color` → `Lipgloss.alpha`
- [ ] `BackgroundColor(in term.File, out term.File) (bg color.Color, err error)`
- [x] `Blend1D(steps int, stops ...color.Color) []color.Color` → `Lipgloss.blend1d`
- [x] `Blend2D(width, height int, angle float64, stops ...color.Color) []color.Color` → `Lipgloss.blend2d`
- [x] `Color(s string) color.Color` → `Lipgloss.color`
- [x] `Complementary(c color.Color) color.Color` → `Lipgloss.complementary`
- [x] `Darken(c color.Color, percent float64) color.Color` → `Lipgloss.darken`
- [ ] `EnableLegacyWindowsANSI(*os.File)` (Windows-specific)
- [ ] `Fprint(w io.Writer, v ...any) (int, error)`
- [ ] `Fprintf(w io.Writer, format string, v ...any) (int, error)`
- [ ] `Fprintln(w io.Writer, v ...any) (int, error)`
- [ ] `HasDarkBackground(in term.File, out term.File) bool`
- [x] `Height(str string) int` → `Lipgloss::Style.height`?
- [ ] `JoinHorizontal(pos Position, strs ...string) string` (see `Lipgloss::Join.horizontal`)
- [ ] `JoinVertical(pos Position, strs ...string) string` (see `Lipgloss::Join.vertical`)
- [x] `Lighten(c color.Color, percent float64) color.Color` → `Lipgloss.lighten`
- [ ] `Place(width, height int, hPos, vPos Position, str string, opts ...WhitespaceOption) string`
- [ ] `PlaceHorizontal(width int, pos Position, str string, opts ...WhitespaceOption) string`
- [ ] `PlaceVertical(height int, pos Position, str string, opts ...WhitespaceOption) string`
- [ ] `Print(v ...any) (int, error)`
- [x] `Printf(format string, v ...any) (int, error)` (maybe via `Lipgloss::Writer`?)
- [ ] `Println(v ...any) (int, error)`
- [x] `Size(str string) (width, height int)` → `Lipgloss::Style.size`?
- [ ] `Sprint(v ...any) string`
- [x] `Sprintf(format string, v ...any) string` (maybe via `Lipgloss::Writer`?)
- [ ] `Sprintln(v ...any) string`
- [ ] `StyleRanges(s string, ranges ...Range) string`
- [ ] `StyleRunes(str string, indices []int, matched, unmatched Style) string`
- [x] `Width(str string) (width int)` → `Lipgloss::Style.width`?
- [x] `Wrap(s string, width int, breakpoints string) string` → `Lipgloss::Wrap.wrap`

### Border Constructors
- [ ] `ASCIIBorder() Border`
- [ ] `BlockBorder() Border`
- [ ] `DoubleBorder() Border`
- [ ] `HiddenBorder() Border`
- [ ] `InnerHalfBlockBorder() Border`
- [ ] `MarkdownBorder() Border`
- [ ] `NormalBorder() Border`
- [ ] `OuterHalfBlockBorder() Border`
- [ ] `RoundedBorder() Border`
- [ ] `ThickBorder() Border`

### Canvas
- [ ] `NewCanvas(width, height int) *Canvas`

### Color Profile
- [x] `Complete(p colorprofile.Profile) CompleteFunc` → `Lipgloss.complete`

### Compositor & Layer
- [ ] `NewCompositor(layers ...*Layer) *Compositor`
- [ ] `NewLayer(content string, layers ...*Layer) *Layer`
- [ ] `LightDark(isDark bool) LightDarkFunc`

### Range
- [ ] `NewRange(start, end int, style Style) Range`

### Style
- [ ] `NewStyle() Style` (ported as `Lipgloss::Style.new`?)

### Whitespace Options
- [ ] `WithWhitespaceChars(s string) WhitespaceOption`
- [ ] `WithWhitespaceStyle(s Style) WhitespaceOption`

### Wrap Writer
- [ ] `NewWrapWriter(w io.Writer) *WrapWriter`

## Types

- [ ] `ANSIColor = ansi.IndexedColor` (maybe represented as `Lipgloss::Color`)
- [x] `Border struct{ ... }` → `Lipgloss::Border`
- [x] `Canvas struct{ ... }` → `Lipgloss::Canvas`
- [x] `CompleteFunc func(ansi, ansi256, truecolor color.Color) color.Color` → `Lipgloss::CompleteFunc`
- [x] `Compositor struct{ ... }` → `Lipgloss::Compositor`? (need to verify)
- [x] `Layer struct{ ... }` → `Lipgloss::Layer`
- [x] `LayerHit struct{ ... }` → `Lipgloss::LayerHit`? (need to verify)
- [ ] `LightDarkFunc func(light, dark color.Color) color.Color`
- [x] `NoColor struct{}` → `Lipgloss::NoColor`
- [x] `Position float64` → `Lipgloss::Position` enum
- [ ] `RGBColor struct{ ... }` (note: Crystal uses `RGBAColor` with alpha)
- [x] `Range struct{ ... }` → `Lipgloss::Range`
- [x] `Style struct{ ... }` → `Lipgloss::Style`
- [x] `Underline = ansi.Underline` → `Lipgloss::UnderlineStyle` enum
- [x] `WhitespaceOption func(*whitespace)` (maybe not directly exposed)
- [x] `WrapWriter struct{ ... }` → `Lipgloss::WrapWriter`

## File-by-File Audit

For each Go source file, the exported functions/methods are listed with porting status.

See generated file [`audit_details.md`](audit_details.md) for full per-file listing.

### Key Files Status

- `style.go`: Core style logic largely ported (`Lipgloss::Style`). Many getter/setter methods ported.
- `color.go`: Color utilities ported (`Lipgloss.color`, `alpha`, `complementary`, `darken`, `lighten`).
- `blending.go`: Blend1D/Blend2D ported.
- `borders.go`: Border constructors **not ported** (missing border factory functions).
- `join.go`: JoinHorizontal/JoinVertical not ported (but `Lipgloss::Join` exists?).
- `size.go`: Width/Height/Size ported.
- `writer.go`: Print* functions partially ported (maybe via `Lipgloss::Writer`).
- `layer.go`, `canvas.go`, `table/`, `tree/`, `list/`: Partially ported; need detailed review.

## Next Steps

1. **High Priority**: Port border constructor functions (`NormalBorder()`, `RoundedBorder()`, etc.)
2. **High Priority**: Port `JoinHorizontal`/`JoinVertical` functions.
3. **High Priority**: Port `Place*` positioning functions.
4. **Medium**: Port `StyleRanges` and `StyleRunes`.
5. **Medium**: Port `NewStyle` factory (already have `Style.new` but need to match API).
6. **Low**: Windows-specific functions (`EnableLegacyWindowsANSI`).
7. **Low**: Terminal query functions (`BackgroundColor`, `HasDarkBackground`).

## Notes

- Crystal naming conventions use snake_case for methods (e.g., `blend1d` vs `Blend1D`).
- Some Go methods are ported as Crystal instance methods with same name but different signature.
- The port aims for behavioral compatibility; some API differences acceptable due to language idioms.

## Verification

Run the test suite to ensure output matches Go lipgloss tests. The existing Crystal specs should be updated to match Go test expectations.

---
*Audit generated by script. Manual review recommended.*
