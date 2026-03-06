# Development

## Prerequisites

- **Crystal** >= 1.18.2
- **Git** (for submodule management)
- **Go** (for upstream source verification) - optional but recommended
- **rumdl** (for markdown formatting): Install via Rust/Cargo: `cargo install rumdl`

## Setup

1. Clone the repository with submodules:
   ```bash
   git clone --recurse-submodules https://github.com/dsisnero/lipgloss.git
   cd lipgloss
   ```

2. Install Crystal dependencies:
   ```bash
   make install
   ```

3. Verify upstream Go source is available:
   ```bash
   ls vendor/lipgloss/
   ```

## Daily Workflow

1. **Start work session**:
   ```bash
   bd ready              # Find available work
   bd show <id>          # View issue details
   bd update <id> --status in_progress  # Claim work
   ```

2. **Development loop**:
   ```bash
   # Make changes to Crystal source
   make format           # Format code
   make spec             # Run tests
   ```

3. **Verify parity with upstream**:
   ```bash
   # Compare with Go source logic
   cd vendor/lipgloss && go test ./...
   ```

4. **End work session** (mandatory):
   ```bash
   make format           # Final formatting
   ameba src spec        # Lint check
   crystal spec          # Test check
   rumdl fmt docs/ *.md  # Format markdown documentation
   bd close <id>         # Complete work
   bd sync               # Sync with git
   git pull --rebase
   git push
   ```

## Available Commands

| Command | Description |
|---------|-------------|
| `make install` | Install Crystal dependencies |
| `make update` | Update dependencies |
| `make spec` | Run tests (excluding interactive) |
| `make format` | Format Crystal files with `crystal tool format` |
| `make docs` | Generate documentation with `crystal docs` |
| `make clean` | Clean temp/, log/, cache, and built examples |
| `make help` | Show available targets |
| `crystal spec` | Run all Crystal specs |
| `ameba src spec` | Run Crystal linter on source and specs |
| `rumdl fmt docs/ *.md` | Format markdown documentation |