# Coding Guidelines

## Code Style

- **Formatter**: Use `crystal tool format` (via `make format`) for consistent formatting
- **Linter**: Use `ameba` for static analysis - configured in `.ameba.yml`
- **Line length**: Follow Crystal community standards (typically 80-120 chars)
- **Indentation**: 2 spaces (Crystal standard)

## Error Handling

- **Porting principle**: Match Go error semantics exactly
- **Error types**: Use Crystal's exception hierarchy but preserve Go error messages
- **Nil handling**: Use `?` operator and `nil` checks as appropriate for Crystal idioms
- **Validation**: Validate inputs early and fail fast with descriptive errors

## Naming Conventions

- **Files**: `snake_case.cr` for Crystal source files
- **Classes**: `PascalCase` for class and module names
- **Methods**: `snake_case` for method names
- **Variables**: `snake_case` for local variables and instance variables
- **Constants**: `SCREAMING_SNAKE_CASE` for constants

**Porting-specific rules**:
- Preserve Go method names when porting public API
- Use Crystal naming conventions for internal implementation
- Map Go `CamelCase` to Crystal `snake_case` for method arguments

## Documentation

- **Public API**: Document all public methods with Crystal doc comments (`#`)
- **Porting notes**: Add `# Ported from Go: <original-file>:<line>` comments for traceability
- **Examples**: Include usage examples in doc comments when helpful
- **TODOs**: Use `# TODO: ` comments for incomplete porting work

<!-- TODO: Add examples from the codebase -->