CYAN ?= \033[0;36m

.PHONY: deps lint check test
.EXPORT_ALL_VARIABLES:

all: ; @echo "$(CYAN)Welcome$(COFF)"

## install dependencies
deps:
	@printf "$(CYAN)Updating python deps$(COFF)\n"
	pip3 install -U pip poetry
	poetry install

## lint the code
lint:
	@printf "$(CYAN)Auto-formatting with black$(COFF)\n"
	poetry run black jazzmin tests

## check code quality
check:
	@printf "$(CYAN)Running static code analysis$(COFF)\n"
	poetry run flake8
	poetry run black --check jazzmin tests
	poetry run mypy jazzmin tests --ignore-missing-imports

## run the test suite
test:
	@printf "$(CYAN)Running test suite$(COFF)\n"
	poetry run pytest
