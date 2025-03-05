# Code Style Guide

This document outlines the coding standards and style guidelines for the Sample Project.

## General Principles

- **Readability**: Code should be written for humans to read and understand
- **Simplicity**: Prefer simple solutions over complex ones
- **Consistency**: Follow established patterns and conventions
- **Documentation**: Document code purpose, not mechanics
- **Testing**: Write tests alongside code

## Python Style Guidelines

### Code Formatting

We use Black with a line length of 88 characters to format all Python code:

```bash
black src/ tests/
```

### Import Sorting

Imports should be sorted using isort with the Black profile:

```bash
isort src/ tests/
```

### Type Annotations

All code should include type annotations:

```python
def add_numbers(a: int, b: int) -> int:
    """Add two numbers together and return the result."""
    return a + b
```

### Docstrings

Use descriptive docstrings in Google style format:

```python
def complex_function(param1: str, param2: int) -> dict:
    """Short description of function purpose.
    
    More detailed explanation if needed.
    
    Args:
        param1: Description of first parameter
        param2: Description of second parameter
        
    Returns:
        Description of return value
        
    Raises:
        ValueError: When this happens
    """
    # Function implementation
```

### Naming Conventions

- **Modules**: Short, lowercase names, underscores if needed (`my_module.py`)
- **Classes**: CapWords convention (`MyClass`)
- **Functions/Methods**: Lowercase with underscores (`my_function`)
- **Variables**: Lowercase with underscores (`my_variable`)
- **Constants**: ALL_CAPS with underscores (`MY_CONSTANT`)

### Project-Specific Conventions

- Prefix private functions and methods with underscore (`_private_method`)
- Use explicit return types, including `None`
- Prefer composition over inheritance
- Keep functions small and focused on a single responsibility

## Code Quality Checks

All code must pass the following checks:

- **mypy**: No type errors
- **ruff**: No linting errors
- **black**: Formatted according to black
- **isort**: Imports sorted correctly
- **pytest**: All tests passing

## Git Workflow

### Commit Messages

Use conventional commits format:

- `feat:` - A new feature
- `fix:` - A bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, etc.)
- `refactor:` - Code change that neither fixes a bug nor adds a feature
- `test:` - Adding or updating tests
- `chore:` - Changes to build process or auxiliary tools

Example:

```text
feat: add user authentication functionality
```

### Branching Strategy

- `main` - Production-ready code
- `feature/xyz` - Feature development branches
- `bugfix/xyz` - Bug fix branches

## Pre-commit Hooks

Pre-commit hooks automatically enforce these standards before each commit. Configure them with:

```bash
pre-commit install
```
