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

	@echo 'Installing ZSH plugins...'

	@if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then \
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || \
		echo "Warning: Failed to install zsh-syntax-highlighting"; \
	fi

	@if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then \
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || \
		echo "Warning: Failed to install zsh-autosuggestions"; \
	fi

	@if [ ! -d "${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions" ]; then \
		git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions || \
		echo "Warning: Failed to install zsh-completions"; \
	fi

	@echo 'Creating symlinks...'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@ln -sfnv $(abspath config/*) ~/.config
