.PHONY: all test help bash git nvim tmux mise starship tuis themes

SCRIPTS_DIR := scripts
MODULES := bash git nvim tmux mise starship tuis themes

all: $(MODULES)

test:
	@$(SCRIPTS_DIR)/run-tests.exp

$(MODULES):
	@./$@/install.sh

help:
	@echo "Available targets:"
	@echo "  all        Install all configurations"
	@echo "  test       Run tests"
	@echo "  bash       Install Bash config"
	@echo "  git        Install Git config"
	@echo "  nvim       Install Neovim config"
	@echo "  tmux       Install Tmux config"
	@echo "  tuis       Install TUI config"
	@echo "  help       Show this help message"
