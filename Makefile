# Define variables for dotfiles management
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

list: ## List all dotfiles in the repository
	@$(foreach val, $(DOTFILES), ls -dF $(val);)

install: ## Install dotfiles and dependencies
	@echo '==> Starting dotfiles deployment to home directory'
	@echo 'Installing Homebrew packages...'
	@brew bundle install || echo "Warning: Failed to install Homebrew packages"

	@echo 'Creating symlinks...'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@ln -sfnv $(abspath config/*) ~/.config
