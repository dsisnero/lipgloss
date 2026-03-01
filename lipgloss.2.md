# Lipgloss Issue: border_foreground method fails with single color argument

## Problem
The `border_foreground` method in `lib/lipgloss/src/style.cr` fails when called with a single color argument. The error occurs in the `which_sides_color` helper function at line 2946:

```crystal
left = colors[1]
Error: index out of bounds for Tuple(Lipgloss::Color | Lipgloss::NoColor) (1 not in -1..0)
```

## Context
This issue was discovered when trying to use `Bubbles::List::DefaultDelegate` which calls:
```crystal
.border_foreground(light_dark.call("#F793FF", "#AD58B4"))
```

The `border_foreground` method signature is:
```crystal
def border_foreground(*colors : Color | AdaptiveColor | CompleteColor | CompleteAdaptiveColor | NoColor) : Style
```

When called with a single argument, the splat operator creates a tuple with one element, but `which_sides_color` tries to access index 1.

## Root Cause
The `which_sides_color` function expects to handle different numbers of color arguments (1, 2, 3, or 4) to set borders on different sides, but the implementation has a bug when only one color is provided.

## Expected Behavior
- `border_foreground(color)` should set the same color for all four borders
- `border_foreground(top_bottom, left_right)` should set vertical and horizontal colors
- `border_foreground(top, left_right, bottom)` should set top, sides, and bottom colors
- `border_foreground(top, right, bottom, left)` should set each side individually

## Reproduction
```crystal
require "lipgloss"

style = Lipgloss::Style.new
# This fails:
style.border_foreground("#FF0000")
```

## Impact
This breaks Bubbles list components and any other code that uses `border_foreground` with a single color argument.