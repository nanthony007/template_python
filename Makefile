# makefile to manage repetitive commands

all: format lint test

build:
	@echo "Building dockerfile"
	@bash scripts/build.sh

run-container:
	@echo "Building dockerfile..."
	@bash scripts/build.sh
	@echo "Running docker image..."
	@docker run --rm -p 8080:8080 -e PORT="8080" backend

format:
	@echo "********************"
	@echo "Formatting files..."
	@poetry run black . --target-version py38
	@poetry run isort .

lint:
	@echo "********************"
	@echo "Type checking files..."
	@poetry run mypy .
	@echo "********************"
	@echo "Linting files..."
	@poetry run flake8 

test:
	@echo "********************"
	@echo "Testing..."
	@poetry run pytest --color=yes

test-cov:
	@echo "********************"
	@echo "Testing with Coverage..."
	@poetry run pytest --cov

install:
	@echo "Installing dependencies..."
	@pip install poetry
	@poetry install

docs:
	@echo "Serving documentation..."
	@echo poetry run mkdocs serve

deploy-docs:
	@echo "Deploying documentation..."
	@poetry run mkdocs gh-deploy

run:
	@echo "Running..."
	@poetry run uvicorn main:app --reload

.DEFAULT_GOAL := install