.PHONY: all re clean test fish bash git vim vifm tmux vscode help

SCRIPTS_DIR := scripts
FISH_DIR := fish
BASH_DIR := bash
GIT_DIR := git
VIM_DIR := vim
VIFM_DIR := vifm
TMUX_DIR := tmux
VSCODE_DIR := vscode

all: fish bash git vim vifm tmux vscode

re: clean all

clean:
	@$(SCRIPTS_DIR)/clean.sh

test:
	@$(SCRIPTS_DIR)/test.exp

fish:
	@$(FISH_DIR)/install.sh

bash:
	@$(BASH_DIR)/install.sh

git:
	@$(GIT_DIR)/install.sh

vim:
	@$(VIM_DIR)/install.sh

vifm:
	@$(VIFM_DIR)/install.sh

tmux:
	@$(TMUX_DIR)/install.sh

vscode:
	@$(VSCODE_DIR)/install.sh

help:
	@echo "Available targets:"
	@echo "  all        Install all configurations"
	@echo "  re         Clean and reinstall all"
	@echo "  clean      Remove installed files"
	@echo "  test       Run tests"
	@echo "  fish       Install Fish shell config"
	@echo "  bash       Install Bash config"
	@echo "  git        Install Git config"
	@echo "  vim        Install Vim config"
	@echo "  vifm       Install Vifm config"
	@echo "  tmux       Install Tmux config"
	@echo "  vscode     Install VS Code config"
	@echo "  help       Show this help message"
