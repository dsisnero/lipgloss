# Architecture

Lipgloss is a Crystal port of the Go lipgloss terminal styling library that provides a fluent API for styling terminal output with borders, padding, margins, alignment, and layout helpers.

## Project Structure

```
src/
├── lipgloss.cr              # Main entry point and module definition
├── style.cr                 # Core Style class with fluent API
├── renderer.cr              # Terminal rendering and output
├── color.cr                 # Color handling and parsing
├── canvas.cr                # Terminal canvas for drawing
├── geometry.cr              # Size, position, and layout calculations
├── join.cr                  # Joining multiple styled strings
├── layer.cr                 # Layering and z-index management
├── query.cr                 # Style querying and inspection
├── range.cr                 # Text range operations
├── style_table.cr           # Table styling utilities
├── view.cr                  # Viewport and scrolling
├── wrap.cr                  # Text wrapping utilities
├── writer.cr                # Output writing utilities
└── compat/                  # Compatibility modules

spec/                        # Crystal specs (tests)
examples/                    # Example programs
vendor/lipgloss/             # Upstream Go source (submodule)
lib/                         # Installed shard dependencies
```

## Data Flow

1. **Style Creation**: User creates a `Lipgloss::Style` with fluent method calls (`.foreground()`, `.border()`, `.padding()`, etc.)
2. **Style Application**: Style is applied to text via `style.render("text")` or `style.apply_to("text")`
3. **Terminal Rendering**: Renderer processes the styled text, accounting for terminal capabilities and color support
4. **Output**: Final ANSI-escaped string is output to terminal

## Package/Module Responsibilities

- **`Lipgloss::Style`**: Core styling class with fluent API methods
- **`Lipgloss::Renderer`**: Handles terminal detection, color conversion, and final output rendering
- **`Lipgloss::Color`**: Color parsing and representation (hex, RGB, ANSI, adaptive colors)
- **`Lipgloss::Canvas`**: Terminal drawing surface for complex layouts
- **`Lipgloss::Border`**: Border styling definitions and rendering
- **`Lipgloss::Join`**: Utilities for joining multiple styled strings with consistent spacing
- **`Lipgloss::Layer`**: Z-index management for overlapping styled elements

<!-- TODO: Add diagrams if helpful -->