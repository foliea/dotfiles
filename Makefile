.PHONY: all test lint help bash git nvim tmux mise starship tuis

MODULES := bash git nvim tmux mise starship tuis
SHELL_SCRIPTS := $(shell find . -name "*.sh" -not -path "./.git/*")
JSON_FILES := $(shell find . -name "*.json" -not -path "./.git/*")

all: $(MODULES)

test:
	@./run-tests.exp

lint:
	@cd nvim && selene lua/ init.lua plugin/
	@shellcheck --severity=warning $(SHELL_SCRIPTS)
	@actionlint
	@for f in $(JSON_FILES); do jq empty "$$f" || exit 1; done

$(MODULES):
	@./$@/install.sh

help:
	@echo "Available targets:"
	@echo "  all        Install all configurations"
	@echo "  test       Run tests"
	@echo "  lint       Run linters (selene, shellcheck, actionlint, jq)"
	@echo "  bash       Install Bash config"
	@echo "  git        Install Git config"
	@echo "  nvim       Install Neovim config"
	@echo "  tmux       Install Tmux config"
	@echo "  tuis       Install TUI config"
	@echo "  help       Show this help message"
