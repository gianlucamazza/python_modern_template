# Getting Started

This guide will help you set up the Sample Project for development.

## Prerequisites

Before you begin, ensure you have the following installed:

- Python 3.8 or higher
- Git
- Make (optional, but recommended)

## Installation

1. Clone the repository:

```bash
git clone https://github.com/username/sample-project.git
cd sample-project
```

1. Create and activate a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

1. Install the project with development dependencies:

```bash
pip install -e ".[dev]"
```

1. Set up pre-commit hooks:

```bash
pre-commit install
```

## Verification

1. Run the tests:

```bash
make test
# or
pytest tests/
```

1. Run the code checks:

```bash
make lint
# or
mypy src tests
ruff src tests
```

1. Try running the application:

```python
from project_example import main
result = main.run()
print(result)
```

## Development Workflow

1. Create a new branch for your changes:

```bash
git checkout -b feature/your-feature-name
```

1. Make your changes and run the quality checks:

```bash
make format  # Format code
make lint    # Run linters
make test    # Run tests
```

1. Commit your changes using conventional commit messages:

```bash
git commit -m "feat: add new feature"
# or
git commit -m "fix: resolve bug in module"
```

1. Push your branch and create a pull request:

```bash
git push origin feature/your-feature-name
```

## VS Code Integration

If you're using VS Code:

1. Install the recommended extensions when prompted
2. Use the built-in tasks for common operations:
   - Press `Ctrl+Shift+P` and type "Tasks: Run Task"
   - Select from available tasks like "Format: Black + isort" or "Test: Run all tests"
3. Use the debugging configurations in the Run panel
