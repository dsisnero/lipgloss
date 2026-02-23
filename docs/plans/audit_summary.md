# Lipgloss Port Audit Summary

Generated 2026-02-22 19:05:05 -07:00

## Constants

- [x] `Black ansi.BasicColor = iota ...`
- [ ] `NBSP = '\u00A0' ...`
- [ ] `UnderlineNone = ansi.UnderlineNone ...`
- [x] `NoTabConversion = -1`
- [x] `Top Position = 0.0 ...`

## Variables

- [x] `Writer = colorprofile.NewWriter(os.Stdout, os.Environ())`

## Functions

- [x] `Alpha(c color.Color, alpha float64) color.Color`
- [ ] `BackgroundColor(in term.File, out term.File) (bg color.Color, err error)`
- [x] `Blend1D(steps int, stops ...color.Color) []color.Color`
- [ ] `Blend2D(width, height int, angle float64, stops ...color.Color) []color.Color`
- [x] `Color(s string) color.Color`
- [x] `Complementary(c color.Color) color.Color`
- [x] `Darken(c color.Color, percent float64) color.Color`
- [ ] `EnableLegacyWindowsANSI(*os.File)`
- [ ] `Fprint(w io.Writer, v ...any) (int, error)`
- [ ] `Fprintf(w io.Writer, format string, v ...any) (int, error)`
- [ ] `Fprintln(w io.Writer, v ...any) (int, error)`
- [ ] `HasDarkBackground(in term.File, out term.File) bool`
- [x] `Height(str string) int`
- [ ] `JoinHorizontal(pos Position, strs ...string) string`
- [ ] `JoinVertical(pos Position, strs ...string) string`
- [x] `Lighten(c color.Color, percent float64) color.Color`
- [ ] `Place(width, height int, hPos, vPos Position, str string, opts ...WhitespaceOption) string`
- [ ] `PlaceHorizontal(width int, pos Position, str string, opts ...WhitespaceOption) string`
- [ ] `PlaceVertical(height int, pos Position, str string, opts ...WhitespaceOption) string`
- [ ] `Print(v ...any) (int, error)`
- [x] `Printf(format string, v ...any) (int, error)`
- [ ] `Println(v ...any) (int, error)`
- [x] `Size(str string) (width, height int)`
- [ ] `Sprint(v ...any) string`
- [x] `Sprintf(format string, v ...any) string`
- [ ] `Sprintln(v ...any) string`
- [ ] `StyleRanges(s string, ranges ...Range) string`
- [ ] `StyleRunes(str string, indices []int, matched, unmatched Style) string`
- [x] `Width(str string) (width int)`
- [x] `Wrap(s string, width int, breakpoints string) string`
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
- [ ] `NewCanvas(width, height int) *Canvas`
- [x] `Complete(p colorprofile.Profile) CompleteFunc`
- [ ] `NewCompositor(layers ...*Layer) *Compositor`
- [ ] `NewLayer(content string, layers ...*Layer) *Layer`
- [ ] `LightDark(isDark bool) LightDarkFunc`
- [ ] `NewRange(start, end int, style Style) Range`
- [ ] `NewStyle() Style`
- [ ] `WithWhitespaceChars(s string) WhitespaceOption`
- [ ] `WithWhitespaceStyle(s Style) WhitespaceOption`
- [ ] `NewWrapWriter(w io.Writer) *WrapWriter`

## Types

- [ ] `ANSIColor = ansi.IndexedColor`
- [x] `Border struct{ ... }`
- [x] `Canvas struct{ ... }`
- [x] `CompleteFunc func(ansi, ansi256, truecolor color.Color) color.Color`
- [x] `Compositor struct{ ... }`
- [x] `Layer struct{ ... }`
- [x] `LayerHit struct{ ... }`
- [ ] `LightDarkFunc func(light, dark color.Color) color.Color`
- [x] `NoColor struct{}`
- [x] `Position float64`
- [ ] `RGBColor struct{ ... }`
- [x] `Range struct{ ... }`
- [x] `Style struct{ ... }`
- [x] `Underline = ansi.Underline`
- [x] `WhitespaceOption func(*whitespace)`
- [x] `WrapWriter struct{ ... }`
