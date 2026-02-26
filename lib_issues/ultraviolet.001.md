# Ultraviolet Issue #001: Render output does not trim trailing spaces

## Description

When rendering a buffer with trailing space cells (empty cells or cells with
space content), the rendered string includes those trailing spaces. The Go
lipgloss canvas render trims trailing spaces from each line.

## Reproduction

1. Create a ScreenBuffer with width 5, height 2.
2. Set cells 0-2 to "A", cells 3-4 to space (or empty).
3. Call `render()`.

**Expected output:**

```text
AAA
AAA
```

**Actual output (with two trailing spaces on each line):**

```text
AAA
AAA
```

## Root Cause

The `Ultraviolet::Buffer#render` method (and `Line#render_line`) does not trim
trailing spaces. The `Ultraviolet.trim_space` utility exists but is not used in
the render pipeline.

## Impact

Lipgloss Canvas port fails spec `"trims trailing spaces on render"`. The Go
lipgloss canvas behavior expects trimmed spaces.

## Suggested Fix

Modify `Ultraviolet::Buffer#render` to apply `Ultraviolet.trim_space` to the
final string, or modify `Line#render_line` to skip trailing empty cells.

## Workaround (for lipgloss port)

Override `Canvas#render` to call `Ultraviolet.trim_space(@buffer.render)`.

## References

* `src/ultraviolet/buffer.cr`: `def self.trim_space` (line 684)
* `src/ultraviolet/buffer.cr`: `class Buffer#render` (line 258)
* `vendor/lipgloss/canvas_test.go`: `TestCanvasRenderWithTrailingSpaces`
