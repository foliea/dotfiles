.PHONY: all re clean test help fish bash git nvim tmux vscode tuis

SCRIPTS_DIR := scripts
MODULES := fish bash git nvim tmux vscode tuis

all: $(MODULES)

re: clean all

clean:
	@$(SCRIPTS_DIR)/clean.sh

test:
	@$(SCRIPTS_DIR)/test.exp

$(MODULES):
	@./$@/install.sh

help:
	@echo "Available targets:"
	@echo "  all        Install all configurations"
	@echo "  re         Clean and reinstall all"
	@echo "  clean      Remove installed files"
	@echo "  test       Run tests"
	@echo "  fish       Install Fish shell config"
	@echo "  bash       Install Bash config"
	@echo "  git        Install Git config"
	@echo "  nvim       Install Neovim config"
	@echo "  tmux       Install Tmux config"
	@echo "  vscode     Install VS Code config"
	@echo "  tuis       Install TUI config"
	@echo "  help       Show this help message"
