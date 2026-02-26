# Ultraviolet Issue #002: CellAt returns value type, preventing in-place mutation

## Description

`Ultraviolet::Screen#cell_at` returns `Cell?` (a value type). Mutating the
returned cell does not affect the underlying buffer. Go's `uv.Screen.CellAt`
returns `*uv.Cell` pointer; mutating the pointer updates the buffer.

## Reproduction

1. Create a ScreenBuffer.
2. Call `cell_at(x, y)` to get a cell.
3. Modify its `content` property.
4. Call `cell_at(x, y)` again — the content is unchanged.

**Expected:** Mutation affects buffer (as in Go).
**Actual:** Mutation only affects local copy.

## Root Cause

Crystal structs are value types; returning a Cell from an array gives a copy.
The Go version returns a pointer to the actual cell in the buffer's internal
slice.

## Impact

Lipgloss Canvas port cannot match Go behavior where
`canvas.CellAt(x, y).Content = "X"` updates the canvas. The port must use
`set_cell` explicitly, breaking compatibility with Go code patterns.

## Suggested Fix

Option A: Return a mutable reference (not possible in Crystal). Option B: Return
a proxy object that delegates getters and forwards setters to buffer. Option C:
Add `mutate_cell(x, y, &block : Cell ->)` method. Option D: Store cells as
`Cell` class instances (reference types) instead of structs.

## Workaround (for lipgloss port)

Implement `Canvas#cell_at` returning a `CellProxy` that calls `set_cell` on
mutation. Or override tests to use `set_cell`.

## References

* `src/ultraviolet/buffer.cr`: `Line#at` (line 44)
* `src/ultraviolet/buffer.cr`: `class ScreenBuffer` includes `Screen`
* `vendor/lipgloss/canvas.go`: `CellAt` returns `*uv.Cell`
* `vendor/lipgloss/canvas_test.go`: `cell.Content = "."` pattern
