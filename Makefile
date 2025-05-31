.PHONY: all re clean test help fish bash git vim vifm tmux vscode

SCRIPTS_DIR := scripts
MODULES := fish bash git vim vifm tmux vscode

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
	@echo "  vim        Install Vim config"
	@echo "  vifm       Install Vifm config"
	@echo "  tmux       Install Tmux config"
	@echo "  vscode     Install VS Code config"
	@echo "  help       Show this help message"
