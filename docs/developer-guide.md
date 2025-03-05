# Developer Guide

This guide provides detailed information for developers working on the Sample Project.

## Project Structure

```text
project_root/
├── .vscode/                # VS Code configuration
│   ├── extensions.json     # Recommended extensions
│   ├── launch.json         # Debug configurations
│   ├── settings.json       # Editor settings
│   └── tasks.json          # Custom tasks
│
├── src/                    # Source code
│   └── project_example/   # Main package
│       ├── __init__.py     # Package initialization
│       └── main.py         # Main module
│
├── tests/                  # Test suite
│   ├── __init__.py         # Test package initialization
│   └── test_main.py        # Tests for main module
│
├── docs/                   # Documentation
│   ├── index.md            # Documentation home
│   └── ...                 # Other documentation files
│
├── pyproject.toml          # Project metadata and dependencies
├── .pre-commit-config.yaml # Pre-commit hooks configuration
├── .gitignore              # Git ignore file
└── Makefile                # Project automation
```

## Development Environment

### Virtual Environment

Always use a virtual environment to avoid dependency conflicts:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### Installing Dependencies

Development dependencies are specified in the `pyproject.toml` file and can be installed with:

```bash
pip install -e ".[dev]"
```

### Editor Configuration

We recommend using VS Code with the provided configuration files. This setup includes:

- Automatic formatting on save
- Real-time linting and type checking
- Integrated test running and debugging
- Custom tasks for common operations

## Code Quality Tools

### Type Checking with mypy

We use static type checking to catch type-related errors early:

```bash
mypy src tests
```

Configuration for mypy is in `pyproject.toml`.

### Formatting with black and isort

All code should be formatted with black and imports sorted with isort:

```bash
black src tests
isort src tests
```

Or use the make command:

```bash
make format
```

### Linting with ruff

Ruff provides fast linting for Python:

```bash
ruff src tests
```

### Pre-commit Hooks

The pre-commit configuration automatically runs these checks before each commit:

```bash
pre-commit run --all-files
```

## Testing

### Running Tests

Tests are written using pytest and can be run with:

```bash
pytest tests/
```

Or using make:

```bash
make test
```

### Test Coverage

Generate a coverage report with:

```bash
make coverage
```

This creates both a terminal report and an HTML report in the `htmlcov/` directory.

## Continuous Integration

The project is set up for CI with GitHub Actions, running:

- Code quality checks (ruff, mypy)
- Tests on multiple Python versions
- Test coverage reporting

## Documentation

Documentation is written in Markdown and stored in the `docs/` directory.

To build documentation:

1. Install mkdocs:

```bash
pip install mkdocs mkdocs-material
```

1. Build the documentation:

```bash
mkdocs build
```

1. Or serve it locally:

```bash
mkdocs serve
```
