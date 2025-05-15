.PHONY: setup setup-dev install install-dev generate run format check clean set-token

# Installation targets
setup: install

install:
	python -m pip install -r requirements.txt

format:
	python -m ruff format .
	python -m ruff check --fix --unsafe-fixes .

clean:
	rm -rf __pycache__
	rm -rf *.egg-info
	rm -rf .pytest_cache
	find . -name "*.pyc" -delete
	rm -rf .ruff_cache

# All-in-one commands
all: setup generate

all-dev: setup-dev generate 