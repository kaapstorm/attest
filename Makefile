.PHONY: test flakes tags clean install sync build release official

all: test

install:
	@uv sync

sync:
	@uv sync --all-extras

test:
	@uv run attest -rquickfix

flakes:
	@uv run pyflakes attest

tags:
	@ctags -R attest

clean:
	@git clean -ndx
	@echo
	@echo | xargs -p git clean -fdx

build:
	@uv build

release: build
	@echo "Built distribution packages"

official:
	@uv run tox -e ALL
	@echo "Run 'uv publish' to upload to PyPI"
