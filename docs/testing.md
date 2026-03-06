# Testing

## Running Tests

```bash
make spec               # Run all tests (excluding interactive)
crystal spec            # Alternative: run all Crystal specs
```

## Test Conventions

- **Test files**: Located in `spec/` directory with `_spec.cr` suffix
- **Test structure**: Use Crystal's built-in `Spec` framework
- **Test naming**: `describe "ClassName" do` for class tests, `describe "#method_name" do` for method tests
- **Fixtures**: Use `spec/fixtures/` directory for test data when needed

## Writing Tests

**Porting priority**: Test output must match Go test output exactly

1. **Reference upstream tests**: Check `vendor/lipgloss/` for Go test files
2. **Preserve test cases**: Port all test cases from Go source
3. **Verify output**: Use golden tests or exact string matching to ensure parity
4. **Add Crystal-specific tests**: Only for Crystal-specific functionality not in upstream

**Example test pattern**:
```crystal
describe Lipgloss::Style do
  describe "#foreground" do
    it "sets foreground color" do
      style = Lipgloss::Style.new.foreground(Lipgloss::Color::RED)
      # Test logic here
    end
  end
end
```

## Coverage

- **Coverage tool**: Use `crystal spec --coverage` for code coverage reports
- **Coverage goal**: Aim for 100% porting coverage (all Go functionality tested)
- **Coverage directory**: Output goes to `./coverage/` directory

<!-- TODO: Add coverage commands if available -->