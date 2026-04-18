.PHONY: all test help fish bash git nvim tmux

SCRIPTS_DIR := scripts
MODULES := fish bash git nvim tmux

all: $(MODULES)

test:
	@$(SCRIPTS_DIR)/run-tests.exp

$(MODULES):
	@./$@/install.sh

help:
	@echo "Available targets:"
	@echo "  all        Install all configurations"
	@echo "  test       Run tests"
	@echo "  fish       Install Fish shell config"
	@echo "  bash       Install Bash config"
	@echo "  git        Install Git config"
	@echo "  nvim       Install Neovim config"
	@echo "  tmux       Install Tmux config"
	@echo "  help       Show this help message"
