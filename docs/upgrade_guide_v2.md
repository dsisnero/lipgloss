# Lip Gloss v2 Upgrade Guide

This guide covers migrating from Lip Gloss v1 (`github.com/charmbracelet/lipgloss`)
to Lip Gloss v2 (`dsisnero/lipgloss`). It is written for both humans and
LLMs performing automated migrations.

---

## Table of Contents

1. [Quick Start](#quick-start)
2. [Module Path](#module-path)
3. [Color System](#color-system)
4. [Renderer Removal](#renderer-removal)
5. [Printing and Color Downsampling](#printing-and-color-downsampling)
6. [Background Detection and Adaptive Colors](#background-detection-and-adaptive-colors)
7. [Whitespace Options](#whitespace-options)
8. [Underline](#underline)
9. [Style API Changes](#style-api-changes)
10. [Tree Subpackage](#tree-subpackage)
11. [Removed APIs](#removed-apis)
12. [Quick Reference Table](#quick-reference-table)

---

## Quick Start

For the fastest possible upgrade, do these two things:

### 1. Use the `Compat` module for adaptive/complete colors

```crystal
require "lipgloss"

# v1
color = Lipgloss::AdaptiveColor.new(light: "#f1f1f1", dark: "#cccccc")

# v2
color = Lipgloss::Compat::AdaptiveColor.new(
  light: Lipgloss.color("#f1f1f1"),
  dark: Lipgloss.color("#cccccc")
)
```

The `Compat` module reads `stdin`/`stdout` globally, just like v1. To
customize:

```crystal
require "lipgloss"
require "colorprofile"

Lipgloss::Compat.has_dark_background = Lipgloss.has_dark_background?(STDIN, STDERR)
Lipgloss::Compat.profile = Colorprofile.detect(STDERR, ENV.map { |k, v| "#{k}=#{v}" }.to_a)
```

### 2. Use Lip Gloss writers for output

```crystal
# v1
puts s

# v2
Lipgloss.println(s)
```

This ensures colors are automatically downsampled. If you're using Bubble Tea
v2, this step is unnecessary — Bubble Tea handles it for you.

**That's the quick path.** Read on for the full migration details.

---

## Module Path

The import path has changed.

```crystal
# v1
require "github.com/charmbracelet/lipgloss"

# v2
require "lipgloss"
```

**Install:**

```yaml
# shard.yml
dependencies:
  lipgloss:
    github: dsisnero/lipgloss
```

All subpackages follow the same pattern:

```crystal
# v1
require "github.com/charmbracelet/lipgloss/table"
require "github.com/charmbracelet/lipgloss/tree"
require "github.com/charmbracelet/lipgloss/list"

# v2
require "lipgloss/tree"
require "lipgloss/list"
# Note: table subpackage not yet ported
```

**Search-and-replace pattern:**

```
github.com/charmbracelet/lipgloss → lipgloss
```

---

## Color System

This is the most significant API change.

### `Color` is now a struct, not a string type

```crystal
# v1 — Color was often used as string
var c = "21"
var c = "#ff00ff"

# v2 — Color is a struct with factory methods
c = Lipgloss.color("21")
c = Lipgloss.color("#ff00ff")
c = Lipgloss::Color.from_hex("#ff00ff")
c = Lipgloss::Color.indexed(21)
c = Lipgloss::Color.rgb(255, 0, 255)
```

The `Lipgloss.color` method returns `Color | NoColor`.

### `TerminalColor` interface is removed

All methods that accepted `TerminalColor` now accept `Color` or `Color | NoColor`:

```crystal
# v1
def (s Style).foreground(c : TerminalColor) : Style
def (s Style).background(c : TerminalColor) : Style
def (s Style).border_foreground(c : TerminalColor) : Style

# v2
def foreground(c : Color | NoColor) : Style
def background(c : Color | NoColor) : Style
def border_foreground(c : Color | NoColor) : Style
```

**Migration:** Replace every `TerminalColor` with `Color | NoColor`.

### `ANSIColor` is now an alias

```crystal
# v1 — custom uint type
type ANSIColor = UInt32

# v2 — alias for Int32
alias ANSIColor = Int32
```

v2 also exports named constants for the 16 basic ANSI colors:

```crystal
Lipgloss::Color::BLACK, Lipgloss::Color::RED, Lipgloss::Color::GREEN, Lipgloss::Color::YELLOW,
Lipgloss::Color::BLUE, Lipgloss::Color::MAGENTA, Lipgloss::Color::CYAN, Lipgloss::Color::WHITE,
Lipgloss::Color::BRIGHT_BLACK, Lipgloss::Color::BRIGHT_RED, Lipgloss::Color::BRIGHT_GREEN,
Lipgloss::Color::BRIGHT_YELLOW, Lipgloss::Color::BRIGHT_BLUE, Lipgloss::Color::BRIGHT_MAGENTA,
Lipgloss::Color::BRIGHT_CYAN, Lipgloss::Color::BRIGHT_WHITE
```

### `AdaptiveColor`, `CompleteColor`, `CompleteAdaptiveColor`

These types have been moved to the `Compat` module for drop-in replacement, or use the new `light_dark` and `complete` helpers for explicit control:

```crystal
# v1
color = Lipgloss::AdaptiveColor.new(light: "#f1f1f1", dark: "#cccccc")

# v2 — using Compat (quick path)
# Note: Lipgloss.color returns Color | NoColor, but AdaptiveColor expects Color
# For valid color strings, we can safely cast or use Color.from_hex
light_color = Lipgloss.color("#0000ff").as(Lipgloss::Color)
dark_color = Lipgloss.color("#000099").as(Lipgloss::Color)
color = Lipgloss::Compat::AdaptiveColor.new(light: light_color, dark: dark_color)

# Alternative: Use Color.from_hex which always returns Color
color = Lipgloss::Compat::AdaptiveColor.new(
  light: Lipgloss::Color.from_hex("#0000ff"),
  dark: Lipgloss::Color.from_hex("#000099")
)

# v2 — using light_dark (recommended)
has_dark = Lipgloss.has_dark_background(STDIN, STDOUT)
light_dark = Lipgloss.light_dark(has_dark)
color = light_dark.call(Lipgloss.color("#0000ff"), Lipgloss.color("#000099"))
```

```crystal
# v1
color = Lipgloss::CompleteColor.new(true_color: "#ff00ff", ansi256: "200", ansi: "5")

# v2 — using Compat
# CompleteColor accepts Color? (nullable), so we can use Lipgloss.color directly
color = Lipgloss::Compat::CompleteColor.new(
  true_color: Lipgloss.color("#ff00ff"),
  ansi256: Lipgloss.color("200"),
  ansi: Lipgloss.color("5")
)

# v2 — using complete (recommended)
profile = Colorprofile.detect(STDOUT, ENV.map { |k, v| "#{k}=#{v}" }.to_a)
complete = Lipgloss.complete(profile)
color = complete.call(Lipgloss.color("5"), Lipgloss.color("200"), Lipgloss.color("#ff00ff"))
```

Note that `Compat::AdaptiveColor` and friends take `Color` values for
their fields, not strings.

---

## Renderer Removal

The `Renderer` type and all associated functions are removed. In v1, every
`Style` carried a `*Renderer` pointer and the package maintained a global
default renderer.

```crystal
# v1 — these no longer exist
Lipgloss.default_renderer()
Lipgloss.set_default_renderer(r)
Lipgloss.new_renderer(w, opts...)
Lipgloss.color_profile()
Lipgloss.set_color_profile(p)
renderer.new_style()
```

**In v2, `Style` is a plain value type.** There is no renderer. Color
downsampling is handled at the output layer (see next section).

**Migration:**

- Replace `Lipgloss.default_renderer().new_style()` with `Lipgloss::Style.new()`.
- Replace `renderer.new_style()` with `Lipgloss::Style.new()`.
- Remove any `Renderer` fields from your types.
- Remove calls to `set_color_profile` — use `Colorprofile.detect` at the output
  layer instead.

---

## Printing and Color Downsampling

In v1, color downsampling happened inside `Style.render()` via the renderer. In
v2, `Render()` always emits full-fidelity ANSI. Downsampling happens when you
print.

### Standalone Usage

Use the Lip Gloss writer functions:

```crystal
s = some_style.render("Hello!")

# Print to stdout with automatic downsampling
Lipgloss.println(s)

# Print to stderr
Lipgloss.fprintln(STDERR, s)

# Render to a string (downsampled for stdout's profile)
str = Lipgloss.print(s)
```

The default writer targets `stdout`. To customize:

```crystal
Lipgloss::Writer.default = Colorprofile::Writer.new(STDERR, ENV.to_a)
```

### With Bubble Tea

No changes needed. Bubble Tea v2 handles downsampling internally.

---

## Background Detection and Adaptive Colors

### Standalone

v1 detected the background color automatically via the global renderer. v2
requires explicit queries:

```crystal
# v1
has_dark = Lipgloss.has_dark_background?

# v2 — specify the input and output
has_dark = Lipgloss.has_dark_background(STDIN, STDOUT)
```

Then use `light_dark` to pick colors:

```crystal
light_dark = Lipgloss.light_dark(has_dark)
fg = light_dark.call(Lipgloss.color("#333333"), Lipgloss.color("#f1f1f1"))

s = Lipgloss::Style.new.foreground(fg)
```

### With Bubble Tea

Request the background color in `Init` and listen for the response:

```crystal
def init : Tea::Cmd
  Tea.request_background_color
end

def update(msg : Tea::Msg) : {Tea::Model, Tea::Cmd}
  case msg
  when Tea::BackgroundColorMsg
    @styles = new_styles(msg.dark?)
  end
  # ...
end

def new_styles(bg_is_dark : Bool) : Styles
  light_dark = Lipgloss.light_dark(bg_is_dark)
  Styles.new(
    title: Lipgloss::Style.new.foreground(light_dark.call(
      Lipgloss.color("#333333"),
      Lipgloss.color("#f1f1f1")
    ))
  )
end
```

---

## Whitespace Options

The separate foreground/background whitespace options have been replaced by a
single style option:

```crystal
# v1
Lipgloss.place(width, height, h_pos, v_pos, str,
  whitespace_foreground: Lipgloss.color("#333"),
  whitespace_background: Lipgloss.color("#000"),
)

# v2
Lipgloss.place(width, height, h_pos, v_pos, str,
  Lipgloss.with_whitespace_style(Lipgloss::Style.new.
    foreground(Lipgloss.color("#333")).
    background(Lipgloss.color("#000")))
)
```

---

## Underline

`underline(bool)` still works for basic on/off. v2 adds fine-grained control:

```crystal
# v1
s = Lipgloss::Style.new.underline(true)

# v2 — still works
s = Lipgloss::Style.new.underline(true)

# v2 — new: specific styles
s = Lipgloss::Style.new.underline_style(Lipgloss::UnderlineCurly)

# v2 — new: colored underlines
s = Lipgloss::Style.new.
  underline_style(Lipgloss::UnderlineSingle).
  underline_color(Lipgloss.color("#FF0000"))
```

Internally, `underline(true)` is equivalent to `underline_style(UnderlineSingle)`
and `underline(false)` is equivalent to `underline_style(UnderlineNone)`.

---

## Style API Changes

### `Style.new()` is no longer tied to a Renderer

```crystal
# v1
s = Lipgloss::Style.new         # uses global renderer
s = renderer.new_style          # uses specific renderer

# v2
s = Lipgloss::Style.new         # pure value, no renderer
```

### Color getters return `Color | NoColor`

```crystal
# v1
fg = s.foreground # returns TerminalColor

# v2
fg = s.foreground # returns Color | NoColor
```

### New style methods

| Method | Description |
|---|---|
| `underline_style(underline : Underline)` | Set underline style (single, double, curly, etc.) |
| `underline_color(color : Color | NoColor)` | Set underline color |
| `padding_char(char : Char)` | Set the character used for padding fill |
| `margin_char(char : Char)` | Set the character used for margin fill |
| `hyperlink(link : String, params : String...)` | Set a clickable hyperlink |
| `border_foreground_blend(*colors : Color | NoColor)` | Apply gradient colors to borders |
| `border_foreground_blend_offset(offset : Int32)` | Set the offset for border gradient |

Each has a corresponding `get_*`, `unset_*`, and where applicable accessor.

---

## Tree Subpackage

The import path changes and there are new styling options:

```crystal
# v1
require "github.com/charmbracelet/lipgloss/tree"

# v2
require "lipgloss/tree"
```

New methods:

- `indenter_style(style : Lipgloss::Style)` — set a static style for tree indentation.
- `indenter_style_func(func : Proc(Children, Int32, Lipgloss::Style))` — conditionally style
  indentation.
- `width(width : Int32)` — set tree width for padding.

---

## Removed APIs

The following types and functions no longer exist in v2. This table shows each
removed symbol and its replacement.

| v1 Symbol | v2 Replacement |
|---|---|
| `type Renderer` | Removed entirely |
| `default_renderer()` | Not needed |
| `set_default_renderer(r)` | Not needed |
| `new_renderer(w, opts...)` | Not needed |
| `color_profile()` | `Colorprofile.detect(w, env)` |
| `set_color_profile(p)` | Set `Lipgloss::Writer.default.profile` |
| `has_dark_background?()` (no args) | `Lipgloss.has_dark_background?(in, out)` |
| `set_has_dark_background(b)` | Not needed — pass bool to `light_dark` |
| `type TerminalColor` | `Lipgloss::Color | Lipgloss::NoColor` |
| `type Color string` | `Lipgloss.color(string)` returns `Color | NoColor` |
| `type ANSIColor uint` | `alias ANSIColor = Int32` |
| `type AdaptiveColor` | `Lipgloss::Compat::AdaptiveColor` or `light_dark` |
| `type CompleteColor` | `Lipgloss::Compat::CompleteColor` or `complete` |
| `type CompleteAdaptiveColor` | `Lipgloss::Compat::CompleteAdaptiveColor` |
| `whitespace_foreground` option | `whitespace_style` option |
| `whitespace_background` option | `whitespace_style` option |
| `renderer.new_style()` | `Lipgloss::Style.new()` |

---

## Quick Reference Table

A side-by-side summary for common patterns:

| Task | v1 | v2 |
|---|---|---|
| Import | `require "github.com/charmbracelet/lipgloss"` | `require "lipgloss"` |
| Create style | `Lipgloss::Style.new()` | `Lipgloss::Style.new()` |
| Hex color | `Lipgloss.color("#ff00ff")` | `Lipgloss.color("#ff00ff")` |
| ANSI color | `Lipgloss.color("5")` | `Lipgloss.color("5")` or `Lipgloss::Color::MAGENTA` |
| Adaptive color | `Lipgloss::AdaptiveColor.new(light: "#fff", dark: "#000")` | `Lipgloss::Compat::AdaptiveColor.new(light: Lipgloss.color("#fff"), dark: Lipgloss.color("#000"))` |
| Set foreground | `s.foreground(Lipgloss.color("5"))` | `s.foreground(Lipgloss.color("5"))` |
| Print with downsampling | `puts s.render("hi")` | `Lipgloss.println(s.render("hi"))` |
| Detect dark bg | `Lipgloss.has_dark_background?()` | `Lipgloss.has_dark_background?(STDIN, STDOUT)` |
| Light/dark color | `Lipgloss::AdaptiveColor.new(...)` | `Lipgloss.light_dark(is_dark).call(light, dark)` |
| Whitespace styling | `whitespace_foreground: c` | `whitespace_style: Lipgloss::Style.new.foreground(c)` |
| Underline | `s.underline(true)` | `s.underline(true)` or `s.underline_style(Lipgloss::UnderlineCurly)` |

---

## Feedback

Questions, issues, or feedback:

- [GitHub Issues](https://github.com/dsisnero/lipgloss/issues)
- [Discord](https://charm.land/discord)
- [Matrix](https://charm.land/matrix)

---

Part of the Crystal port of [Charm](https://charm.land) libraries.

<a href="https://charm.land/"><img alt="The Charm logo" src="https://stuff.charm.land/charm-badge.jpg" width="400"></a>

Charm热爱开源 • Charm loves open source • نحنُ نحب المصادر المفتوحة