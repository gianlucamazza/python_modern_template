.PHONY: setup venv format lint test coverage clean

# Variabili
PYTHON := python
PIP := $(PYTHON) -m pip
VENV := .venv
TEST_DIR := tests

# Virtual environment setup
venv:
	$(PYTHON) -m venv $(VENV)
	@echo "Virtual environment created. Activate it with 'source $(VENV)/bin/activate'"

# Setup iniziale
setup: venv
	$(VENV)/bin/pip install -e ".[dev]"
	$(VENV)/bin/pre-commit install

# Formattazione del codice
format:
	$(VENV)/bin/black src tests
	$(VENV)/bin/isort src tests

# Verifica statica
lint:
	$(VENV)/bin/ruff src tests
	$(VENV)/bin/mypy src tests

# Esecuzione test
test:
	$(VENV)/bin/pytest $(TEST_DIR)

# Test con coverage
coverage:
	$(VENV)/bin/pytest --cov=src $(TEST_DIR) --cov-report=html --cov-report=term

# Pulizia
clean:
	rm -rf .pytest_cache .coverage htmlcov .mypy_cache
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type d -name "*.egg" -exec rm -rf {} +
	find . -type d -name ".ruff_cache" -exec rm -rf {} +
