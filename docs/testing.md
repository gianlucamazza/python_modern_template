# Testing Strategy

This document outlines the testing approach for the Sample Project.

## Testing Philosophy

Our testing strategy is guided by the following principles:

1. **Test-Driven Development**: Write tests before implementation when possible
2. **Comprehensive Coverage**: Aim for high test coverage, especially for core functionality
3. **Fast Feedback**: Tests should run quickly to enable rapid development
4. **Meaningful Tests**: Focus on testing behavior, not implementation details
5. **Maintainable Tests**: Keep tests simple, readable, and maintainable

## Types of Tests

### Unit Tests

Unit tests verify that individual components (functions, classes, methods) work correctly in isolation.

- Located in `tests/` directory
- Follow naming convention: `test_*.py`
- Each test file corresponds to a module in the source code
- Use pytest as the test framework

Example of a unit test:

```python
def test_run_returns_success_status():
    """Test that the run function returns a success status."""
    result = main.run()
    assert result["status"] == "success"
    assert "message" in result
```

### Integration Tests

Integration tests verify that different components work correctly together.

- Located in `tests/integration/` directory
- Prefixed with `test_integration_*.py`
- May require additional setup and teardown

### End-to-End Tests

End-to-end tests verify the entire application works as expected from user perspective.

- Located in `tests/e2e/` directory
- Typically slower to run than unit or integration tests
- Run less frequently (e.g., during CI but not necessarily before each commit)

## Test Organization

Tests should mirror the structure of the source code:

```text
src/project_example/module.py -> tests/test_module.py
src/project_example/package/module.py -> tests/package/test_module.py
```

## Running Tests

### Basic Test Execution

```bash
# Run all tests
pytest

# Run tests in a specific file
pytest tests/test_main.py

# Run a specific test
pytest tests/test_main.py::test_run_returns_success_status
```

### Test with Coverage

```bash
# Generate coverage report
pytest --cov=src

# Generate HTML coverage report
pytest --cov=src --cov-report=html
```

Or use the make command:

```bash
make coverage
```

### Test Configuration

The pytest configuration is in `pyproject.toml` under the `[tool.pytest.ini_options]` section.

## Test Doubles

When testing components with dependencies, use appropriate test doubles:

- **Stubs**: For providing predetermined responses
- **Spies**: For verifying calls were made correctly
- **Mocks**: For both providing responses and verifying behaviors

Use the pytest-mock package for creating test doubles.

## Continuous Integration

All tests are run automatically in the CI pipeline:

1. On pull requests to the main branch
2. On direct pushes to the main branch
3. On a nightly schedule to catch regressions

## Code Coverage Goals

- Aim for at least 80% code coverage overall
- Aim for 90%+ coverage of core business logic
- Uncovered code should be documented with a reason
