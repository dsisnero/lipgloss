---
upstream_repo: "https://github.com/charmbracelet/lipgloss.git"
pinned_revision: "v2.0.0"
import_mode: "submodule"
upstream_submodule_path: "vendor/lipgloss"
---

# Porting Parity

## Upstream Source of Truth

- **Repository**: `https://github.com/charmbracelet/lipgloss.git`
- **Pinned revision**: `v2.0.0`
- **Import mode**: `submodule`
- **Upstream path**: `vendor/lipgloss`

## Parity Scope

| Upstream Module/Path | Crystal Target | Status | Notes |
|----------------------|----------------|--------|-------|
| `style.go` | `src/style.cr` | Ported | Core Style class with fluent API |
| `renderer.go` | `src/renderer.cr` | Ported | Terminal rendering and output |
| `color.go` | `src/color.cr` | Ported | Color handling and parsing |
| `border.go` | `src/style.cr` (Border module) | Ported | Border styling definitions |
| `canvas.go` | `src/canvas.cr` | Ported | Terminal canvas for drawing |
| `join.go` | `src/join.cr` | Ported | Joining multiple styled strings |
| `query.go` | `src/query.cr` | Ported | Style querying and inspection |
| `range.go` | `src/range.cr` | Ported | Text range operations |
| `writer.go` | `src/writer.cr` | Ported | Output writing utilities |
| `helpers.go` | Distributed across modules | Ported | Utility functions integrated |

## Behavior Checklist

- [ ] Public API surface mapped
- [ ] Constants and types ported
- [ ] Error semantics matched
- [ ] Edge cases mirrored
- [ ] Fixtures/goldens verified

## Test Parity

| Upstream Test/Fixture | Crystal Spec | Status | Notes |
|------------------------|--------------|--------|-------|
| `style_test.go` | `spec/style_spec.cr` | Ported | Core style tests |
| `renderer_test.go` | `spec/renderer_spec.cr` | Ported | Renderer tests |
| `color_test.go` | `spec/color_spec.cr` | Ported | Color parsing tests |
| `border_test.go` | `spec/style_spec.cr` | Ported | Border tests integrated |
| `canvas_test.go` | `spec/canvas_spec.cr` | Ported | Canvas tests |
| `join_test.go` | `spec/join_spec.cr` | Ported | Join tests |
| `query_test.go` | `spec/query_spec.cr` | Ported | Query tests |
| `range_test.go` | `spec/range_spec.cr` | Ported | Range tests |
| `writer_test.go` | `spec/writer_spec.cr` | Ported | Writer tests |

## Known Deviations

<!-- TODO: List intentional deviations and why they are unavoidable. -->

## Verification Commands

```bash
crystal tool format src spec
ameba src spec
crystal spec
rumdl fmt docs/ *.md
```