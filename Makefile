.PHONY: all test lint help bash git nvim tmux mise starship tuis themes

SCRIPTS_DIR := scripts
MODULES := bash git tmux mise starship themes
SHELL_SCRIPTS := $(shell find . -name "*.sh" -not -path "./.git/*")

all: bash git nvim tmux mise starship tuis

nvim:
	@./nvim/install.sh
	@./themes/install.sh
tuis:
	@./tuis/install.sh
	@./themes/install.sh

test:
	@$(SCRIPTS_DIR)/run-tests.exp

lint:
	@stylua --config-path nvim/stylua.toml --check nvim/
	@cd nvim && selene lua/ init.lua plugin/
	@shfmt -d -i 2 $(SHELL_SCRIPTS)
	@shellcheck --severity=warning $(SHELL_SCRIPTS)

$(MODULES):
	@./$@/install.sh

help:
	@echo "Available targets:"
	@echo "  all        Install all configurations"
	@echo "  test       Run tests"
	@echo "  lint       Run formatters and linters (stylua, selene, shfmt, shellcheck)"
	@echo "  bash       Install Bash config"
	@echo "  git        Install Git config"
	@echo "  nvim       Install Neovim config"
	@echo "  tmux       Install Tmux config"
	@echo "  tuis       Install TUI config"
	@echo "  help       Show this help message"
