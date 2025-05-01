# Makefile

.PHONY: init help clean

PYTHON = python3
VENV_DIR = .venv

help:
	@echo "Available targets:"
	@echo "  init   - Set up the Python virtual environment, install dependencies, and configure pre-commit hooks."
	@echo "  clean  - Remove the Python virtual environment."

init:
	@test -d $(VENV_DIR) || $(PYTHON) -m venv $(VENV_DIR)  # Create virtual environment if it doesn't exist
	@test -f requirements.txt || (echo "Error: requirements.txt not found!" && exit 1)  # Check for requirements.txt
	$(VENV_DIR)/bin/pip install --upgrade pip  # Upgrade pip
	$(VENV_DIR)/bin/pip install -r requirements.txt  # Install dependencies
	$(VENV_DIR)/bin/pre-commit autoupdate  # Update pre-commit hooks
	$(VENV_DIR)/bin/pre-commit install --hook-type commit-msg  # Install pre-commit hooks
	$(VENV_DIR)/bin/cz init

clean:
	rm -rf $(VENV_DIR)  # Remove the virtual environment
