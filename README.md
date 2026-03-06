<p align="center">
  <strong>Crystal port of the Go lipgloss terminal styling library</strong><br>
  Borders, padding, margins, alignment, and layout helpers for terminal applications
</p>

<p align="center">
  <a href="docs/architecture.md">Architecture</a> &middot;
  <a href="docs/development.md">Development</a> &middot;
  <a href="docs/coding-guidelines.md">Guidelines</a> &middot;
  <a href="docs/testing.md">Testing</a> &middot;
  <a href="docs/pr-workflow.md">PR Workflow</a> &middot;
  <a href="docs/porting-parity.md">Porting Parity</a>
</p>

---

Lipgloss applies cosmetic styling to terminal output—transforming plain text into beautifully formatted, bordered, and colored displays. Like its namesake adds shine and color to lips, this library adds visual polish to command-line interfaces, making them more engaging and readable.

---

## Quick Start

1. Add the dependency to your `shard.yml`:

    ```yaml
    dependencies:
      lipgloss:
        github: dsisnero/lipgloss
    ```

2. Run `shards install`

3. Use in your Crystal code:

    ```crystal
    require "lipgloss"

    style = Lipgloss::Style.new
      .foreground(Lipgloss::Color::CYAN)
      .border(Lipgloss::Border.rounded)
      .padding(1, 2)

    puts style.render("Hello")
    ```

## Features

- **Fluent API**: Chainable methods for intuitive styling
- **Border styles**: Rounded, thick, double, hidden, and custom borders
- **Color support**: Hex, RGB, ANSI, and adaptive terminal colors
- **Layout helpers**: Padding, margins, alignment, and positioning
- **Terminal-aware**: Adaptive rendering based on terminal capabilities
- **Unicode support**: Proper handling of wide characters and emoji

## Development

```bash
make install      # Install dependencies
make spec         # Run tests
make format       # Format Crystal files
rumdl fmt docs/ *.md  # Format markdown documentation
```

See [Development Guide](docs/development.md) for full setup instructions.

## Documentation

| Document | Purpose |
|----------|---------|
| [Architecture](docs/architecture.md) | System design and data flow |
| [Development](docs/development.md) | Setup and daily workflow |
| [Coding Guidelines](docs/coding-guidelines.md) | Code style and conventions |
| [Testing](docs/testing.md) | Test commands and patterns |
| [PR Workflow](docs/pr-workflow.md) | Commits, PRs, and review process |
| [Porting Parity](docs/porting-parity.md) | Upstream source tracking from Go v2.0.0 |

## Contributing

1. Create an issue: `/forge-create-issue`
2. Implement: `/forge-implement-issue <number>`
3. Self-review: `/forge-reflect-pr`
4. Address feedback: `/forge-address-pr-feedback`
5. Update changelog: `/forge-update-changelog`

## Contributors

- [Dominic Sisneros](https://github.com/dsisnero) - creator and maintainer
