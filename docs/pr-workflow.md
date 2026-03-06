# PR Workflow

## Commit Conventions

Format: `<type>(<scope>): <description>`

**Types**:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `refactor`: Code refactoring (no behavior change)
- `test`: Test additions or updates
- `chore`: Maintenance tasks
- `perf`: Performance improvements

**Scopes**: Use module or component name (e.g., `style`, `renderer`, `color`, `border`)

### Examples

```
feat(style): add border styling support
fix(renderer): correct padding calculation for unicode characters
test(color): add tests for hex color parsing
docs(architecture): update data flow diagram
chore(deps): update ameba to v1.7.0
```

## Branch Naming

Format: `<type>/<issue-number>-<short-kebab-description>`

### Examples

```
feat/42-add-rounded-borders
fix/87-padding-calculation-fix
test/15-color-parsing-tests
```

## PR Checklist

- [ ] Code follows project guidelines (see [Coding Guidelines](coding-guidelines.md))
- [ ] Tests added/updated (see [Testing](testing.md))
- [ ] Documentation updated (if applicable)
- [ ] CHANGELOG.md updated for user-facing changes
- [ ] Lint/format checks pass (`crystal tool format`, `ameba src spec`)
- [ ] All tests pass (`crystal spec`)
- [ ] Markdown formatted (`rumdl fmt docs/ *.md`)
- [ ] Upstream parity verified (compare with `vendor/lipgloss`)

## Review Process

1. **Self-review**: Run `/forge-reflect-pr` to check for missing tests, documentation, and cleanup
2. **Peer review**: Request review from maintainers
3. **Address feedback**: Use `/forge-address-pr-feedback` to systematically address review comments
4. **CI verification**: Ensure all checks pass
5. **Merge**: Squash or rebase as appropriate
6. **Changelog**: Update CHANGELOG.md with `/forge-update-changelog`