# lipgloss

Crystal port of the Go lipgloss terminal styling library with borders, padding, margins, alignment, and layout helpers.

## Commands

```bash
make install      # Install dependencies
make update       # Update dependencies
make spec         # Run tests (excluding interactive)
make format       # Format Crystal files
make docs         # Generate documentation
make clean        # Clean temp/, log/, cache, and built examples
make help         # Show available targets
```

## Documentation

| Document | Purpose |
|----------|---------|
| [Architecture](docs/architecture.md) | System design, data flow, package responsibilities |
| [Development](docs/development.md) | Prerequisites, setup, daily workflow |
| [Coding Guidelines](docs/coding-guidelines.md) | Code style, error handling, naming conventions |
| [Testing](docs/testing.md) | Test commands, conventions, patterns |
| [PR Workflow](docs/pr-workflow.md) | Commits, PRs, branch naming, review process |
| [Porting Parity](docs/porting-parity.md) | Upstream source tracking and parity verification |

## Core Principles

1. Upstream Go code (vendor/lipgloss) is the source of truth
2. Test output must match Go test output exactly
3. Logic must match Go source logic exactly
4. Do not skip functionality - port everything
5. Preserve behavior exactly; use Crystal idioms without changing semantics

## Commits

Format: `<type>(<scope>): <description>`

Types: feat, fix, docs, refactor, test, chore, perf

### Examples

```text
feat(style): add border styling support
fix(renderer): correct padding calculation
test(color): add tests for hex color parsing
```

## Crystal Code Gates

```bash
crystal tool format src spec
ameba src spec
crystal spec
rumdl fmt docs/ *.md
```

## External Dependencies

- **Crystal shards**: See `shard.yml` for dependencies (cellwrap, textseg, uniwidth, ansi, ultraviolet, colorprofile, golden, colorful, similar)
- **Upstream Go source**: `vendor/lipgloss` submodule pinned to v2.0.0
- **Development tools**: ameba (linter), rumdl (markdown formatter)

## Debugging

When something breaks:

1. Check upstream Go tests first - run `go test` in `vendor/lipgloss`
2. Compare with Go source logic in `vendor/lipgloss`
3. Verify Crystal implementation matches Go behavior
4. Run Crystal tests with `crystal spec` to identify failures

## Conventions

- Use beads (bd) for issue tracking: `bd ready`, `bd show <id>`, `bd update <id> --status in_progress`, `bd close <id>`, `bd sync`
- Porting from Go v2.0.0 - maintain exact parity
- Follow Crystal naming conventions while preserving Go API surface
- All public API methods must match Go lipgloss API
